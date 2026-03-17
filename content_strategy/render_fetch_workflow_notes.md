# Render + Fetch Workflow Notes

Workflow file:
- [workflows/reference_safe_trend_to_render_and_fetch.json](../workflows/reference_safe_trend_to_render_and_fetch.json)

## What it does
1. Takes a sample trend reference
2. Builds a reference-safe original brief
3. Sends a ComfyUI render request
4. Waits 90 seconds
5. Fetches ComfyUI history using `prompt_id`
6. Extracts the first downloadable render output
7. Downloads the generated video
8. Returns a summary with prompt, status, and download URL

## Important notes
- The wait time is currently fixed at `90` seconds.
- If your render takes longer, increase the `Wait For Render` node amount.
- The workflow assumes your ComfyUI history endpoint is reachable at `/history/{prompt_id}`.
- The workflow assumes downloadable files are exposed through `/view`.

## Recommended next patch
After testing this workflow successfully, the next improvement should be:
- loop until ready instead of single wait
- upload the downloaded binary to Google Drive or S3
- send a Slack or Telegram approval message
- log prompt metadata in Airtable, Sheets, or Notion

## If download fails
The most likely causes are:
- render not finished yet
- different ComfyUI history payload shape
- different `/view` query requirements on your hosted instance

If that happens, inspect the output of `Fetch Render History` and `Extract Download URL` and I can tighten the parser.
