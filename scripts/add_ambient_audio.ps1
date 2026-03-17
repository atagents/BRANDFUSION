param(
    [string]$ManifestPath = ".\video_assets\audio_jobs.sample.json",
    [string]$FfmpegPath = "ffmpeg",
    [string]$FfprobePath = "ffprobe"
)

$ErrorActionPreference = "Stop"

function Get-VideoDurationSeconds {
    param(
        [string]$VideoPath,
        [string]$FfprobePath
    )

    $duration = & $FfprobePath -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 $VideoPath
    if (-not $duration) {
        throw "Could not read duration for $VideoPath"
    }

    return [double]::Parse($duration, [System.Globalization.CultureInfo]::InvariantCulture)
}

function Resolve-WorkspacePath {
    param([string]$PathValue)

    if ([System.IO.Path]::IsPathRooted($PathValue)) {
        return $PathValue
    }

    return [System.IO.Path]::GetFullPath((Join-Path (Get-Location) $PathValue))
}

function Add-StringArgs {
    param(
        [System.Collections.Generic.List[string]]$List,
        [string[]]$Values
    )

    foreach ($value in $Values) {
        $List.Add([string]$value)
    }
}

if (-not (Test-Path $ManifestPath)) {
    throw "Manifest not found: $ManifestPath"
}

$jobs = Get-Content $ManifestPath -Raw | ConvertFrom-Json
if (-not $jobs) {
    throw "Manifest is empty: $ManifestPath"
}

foreach ($job in $jobs) {
    $videoPath = Resolve-WorkspacePath $job.video
    $outputPath = Resolve-WorkspacePath $job.output
    $outputDir = Split-Path $outputPath -Parent

    if (-not (Test-Path $videoPath)) {
        throw "Video not found: $videoPath"
    }

    if (-not $job.layers -or $job.layers.Count -eq 0) {
        throw "No audio layers defined for $($job.video)"
    }

    if (-not (Test-Path $outputDir)) {
        New-Item -ItemType Directory -Path $outputDir -Force | Out-Null
    }

    $duration = Get-VideoDurationSeconds -VideoPath $videoPath -FfprobePath $FfprobePath
    $args = New-Object System.Collections.Generic.List[string]
    Add-StringArgs -List $args -Values @("-y", "-i", $videoPath)

    $filterParts = New-Object System.Collections.Generic.List[string]
    $mixInputs = New-Object System.Collections.Generic.List[string]
    $inputIndex = 1

    foreach ($layer in $job.layers) {
        $audioPath = Resolve-WorkspacePath $layer.file
        if (-not (Test-Path $audioPath)) {
            throw "Audio layer not found: $audioPath"
        }

        $volume = if ($null -ne $layer.volume) { [double]$layer.volume } else { 0.2 }
        $startSeconds = if ($null -ne $layer.startSeconds) { [double]$layer.startSeconds } else { 0 }
        $delayMs = [int][Math]::Round($startSeconds * 1000)
        $label = "a$inputIndex"

        Add-StringArgs -List $args -Values @("-stream_loop", "-1", "-i", $audioPath)
        $filterParts.Add("[$($inputIndex):a]volume=$([string]::Format([System.Globalization.CultureInfo]::InvariantCulture, '{0:0.###}', $volume)),atrim=duration=$([string]::Format([System.Globalization.CultureInfo]::InvariantCulture, '{0:0.###}', $duration)),adelay=${delayMs}|${delayMs},asetpts=N/SR/TB[$label]")
        $mixInputs.Add("[$label]")
        $inputIndex++
    }

    $mixCount = $mixInputs.Count
    $filterParts.Add("$($mixInputs -join '')amix=inputs=${mixCount}:duration=longest:normalize=0,loudnorm=I=-18:TP=-1.5:LRA=11[aout]")
    $filterComplex = $filterParts -join ";"

    Add-StringArgs -List $args -Values @(
        "-filter_complex", $filterComplex,
        "-map", "0:v:0",
        "-map", "[aout]",
        "-c:v", "copy",
        "-c:a", "aac",
        "-b:a", "192k",
        "-shortest",
        $outputPath
    )

    Write-Host "Rendering audio mix for $($job.video) -> $($job.output)"
    & $FfmpegPath @args
    if ($LASTEXITCODE -ne 0) {
        throw "ffmpeg failed for $($job.video)"
    }
}

Write-Host "Done."
