param(
    [Parameter(Mandatory = $true)]
    [string]$SourceVideo,
    [string]$OutputRoot = ".\reference_assets",
    [double]$IntervalSeconds = 2,
    [double]$SceneThreshold = 0.30,
    [string]$FfmpegPath = "ffmpeg",
    [string]$FfprobePath = "ffprobe"
)

$ErrorActionPreference = "Stop"

function Resolve-WorkspacePath {
    param([string]$PathValue)

    if ([System.IO.Path]::IsPathRooted($PathValue)) {
        return $PathValue
    }

    return [System.IO.Path]::GetFullPath((Join-Path (Get-Location) $PathValue))
}

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

$videoPath = Resolve-WorkspacePath $SourceVideo
if (-not (Test-Path $videoPath)) {
    throw "Source video not found: $videoPath"
}

$videoName = [System.IO.Path]::GetFileNameWithoutExtension($videoPath)
$jobRoot = Join-Path (Resolve-WorkspacePath $OutputRoot) $videoName
$intervalDir = Join-Path $jobRoot "interval_frames"
$sceneDir = Join-Path $jobRoot "scene_frames"

New-Item -ItemType Directory -Path $intervalDir -Force | Out-Null
New-Item -ItemType Directory -Path $sceneDir -Force | Out-Null

$duration = Get-VideoDurationSeconds -VideoPath $videoPath -FfprobePath $FfprobePath
$fpsExpr = [string]::Format([System.Globalization.CultureInfo]::InvariantCulture, "1/{0:0.###}", $IntervalSeconds)
$sceneExpr = [string]::Format([System.Globalization.CultureInfo]::InvariantCulture, "gt(scene\,{0:0.###})", $SceneThreshold)

& $FfmpegPath -y -i $videoPath -vf "fps=$fpsExpr,scale=1280:-1" (Join-Path $intervalDir "frame_%04d.jpg")
if ($LASTEXITCODE -ne 0) {
    throw "ffmpeg interval extraction failed"
}

& $FfmpegPath -y -i $videoPath -vf "select='$sceneExpr',scale=1280:-1" -vsync vfr (Join-Path $sceneDir "scene_%04d.jpg")
if ($LASTEXITCODE -ne 0) {
    throw "ffmpeg scene extraction failed"
}

$intervalFrames = Get-ChildItem -Path $intervalDir -File | Sort-Object Name | ForEach-Object { $_.FullName }
$sceneFrames = Get-ChildItem -Path $sceneDir -File | Sort-Object Name | ForEach-Object { $_.FullName }

$manifest = [ordered]@{
    source_video = $videoPath
    duration_seconds = [Math]::Round($duration, 3)
    interval_seconds = $IntervalSeconds
    scene_threshold = $SceneThreshold
    interval_frames = $intervalFrames
    scene_frames = $sceneFrames
}

$manifest | ConvertTo-Json -Depth 6 | Set-Content -Path (Join-Path $jobRoot "manifest.json") -Encoding UTF8
Write-Host "Keyframes exported to $jobRoot"
