# Veo 3 Hybrid Lane Notes

Primary workflow:
- [workflows/reference_safe_trend_to_hybrid_render.json](../workflows/reference_safe_trend_to_hybrid_render.json)

Reference file already in repo:
- [api_veo3.json](../api_veo3.json)

## What this adds
This workflow creates a **hybrid render lane**:
- `wan_local` for cheaper self-hosted generation
- `veo3_partner` for premium generation through Comfy partner nodes

It uses one shared flow for:
- reference-safe brief generation
- brief normalization
- payload building
- submit render
- wait
- fetch history
- download output

## Default route
The sample input currently defaults to:
- `render_engine = veo3_partner`
- `veo_model = veo-3.1-fast-generate`
- `generate_audio = false`

If you want the cheaper lane, change `render_engine` to `wan_local`.

## Important practical note
This Veo lane is designed around the partner-node pattern shown in [api_veo3.json](../api_veo3.json).

That means:
- you still pay Comfy partner credits for Veo jobs
- this is best for premium demos and flagship outputs
- it is not the cheapest scale lane

## Why this is still useful
Use it for:
- sales demos
- client-facing premium outputs
- portfolio clips
- benchmark comparisons against self-hosted WAN

Use `wan_local` for:
- testing
- iteration
- low-tier offers
- automation experiments

## If the Veo lane errors
The most likely reason is that your installed partner-node API expects slightly different input names than the guessed API payload.

Use [api_veo3.json](../api_veo3.json) as the ground truth reference.
The first node to inspect is `Build Render Payload`.

## Recommended next step
After one live test, the next upgrade should be:
- add route selection rules based on budget
- add storage upload after download
- add approval notification
- add cost tracking per render lane
