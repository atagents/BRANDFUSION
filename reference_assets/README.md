# Reference Assets

This folder stores extracted stills and manifests from source videos used as reference material.

Use:
- [scripts/extract_reference_keyframes.ps1](../scripts/extract_reference_keyframes.ps1)

Expected output per source video:
- `/reference_assets/<video_name>/interval_frames`
- `/reference_assets/<video_name>/scene_frames`
- `/reference_assets/<video_name>/manifest.json`

Recommended usage:
1. Extract keyframes from a source video
2. Review the stills manually
3. Keep only the best reference images
4. Feed those references into the hybrid render lane in [workflows/reference_safe_trend_to_hybrid_render.json](../workflows/reference_safe_trend_to_hybrid_render.json)
