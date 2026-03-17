# Music Channel Safe Launchpad

## Best starting formats
Use original or licensed-safe content only.

### 1. Lofi radio
- chill instrumental loop
- soft rain or room ambience
- slow visual loop
- easiest safe format to launch first

### 2. Hiphop instrumental mix
- original beats only
- no famous rapper voice clones
- no copyrighted acapellas
- use artist-inspired mood, not imitation

### 3. Night drive / chill trap
- cinematic loop visuals
- instrumental-only or original vocal textures

## Recommended channel stack
- 20 to 60 minute audio mixes
- 1 to 3 hour loop-video editions
- branded thumbnail pack
- simple scene loop or premium hybrid visuals later

## What not to build
Avoid:
- cloned voices of real rappers
- mashups with unlicensed vocals
- uploads that rely on disclaimer-only copyright logic

## Better replacement
Use:
- original AI-generated instrumentals
- licensed beats
- anonymous original voice textures
- original spoken-word drops

## Repo implementation direction
Short-term:
- use [scripts/add_ambient_audio.ps1](../scripts/add_ambient_audio.ps1) for simple audio-over-video post
- use [scripts/extract_reference_keyframes.ps1](../scripts/extract_reference_keyframes.ps1) to build visual reference sets
- keep premium remake visuals in [workflows/reference_safe_trend_to_hybrid_render.json](../workflows/reference_safe_trend_to_hybrid_render.json)

Next recommended implementation:
- add a music metadata manifest
- add cover-image generation prompts
- add a loop-video export workflow
