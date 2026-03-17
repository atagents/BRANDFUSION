# Reference-Safe JSON Contracts

These are the expected structured outputs for the new workflow at [workflows/reference_safe_trend_to_brief_pipeline.json](../workflows/reference_safe_trend_to_brief_pipeline.json).

## 1. Reference Analyzer
```json
{
  "reference_summary": "Short summary of the source video",
  "hook_type": "contrarian confession",
  "pacing": {
    "avg_shot_seconds": 1.8,
    "estimated_cut_count": 6,
    "energy_curve": ["high", "medium", "high"]
  },
  "visual_mechanics": {
    "environment_type": "bathroom routine",
    "camera_style": "close handheld then gentle push-in",
    "scene_pattern": [
      "hook close-up",
      "ritual detail shot",
      "product payoff"
    ]
  },
  "emotional_trigger": "aspirational calm",
  "copyright_risk_notes": [
    "avoid source wording",
    "avoid copying creator identity"
  ],
  "safe_takeaways": [
    "short ritual structure",
    "luxury morning tone"
  ]
}
```

## 2. Safe Transformer
```json
{
  "new_angle": "small luxury ritual before work",
  "new_setting": "sunlit bathroom vanity",
  "new_subject": "woman preparing for the day",
  "product_role": "serum bottle naturally placed during a routine moment",
  "style_constraints": [
    "balanced exposure",
    "soft contrast",
    "clean composition"
  ],
  "avoid_list": [
    "direct source phrasing",
    "same prop arrangement"
  ],
  "originality_notes": [
    "change the emotional framing",
    "change the environment details"
  ],
  "commercial_direction": "premium but believable lifestyle ad"
}
```

## 3. Render Brief Builder
```json
{
  "master_visual_direction": "premium lifestyle commercial, realistic and clean",
  "hero_prompt": "close-up of a woman's hand placing a skincare serum on a marble bathroom counter, soft daylight, balanced exposure, realistic textures",
  "negative_prompt": "oversaturated colors, harsh contrast, clipped highlights, warped hands, cluttered background",
  "duration_seconds": 4,
  "aspect_ratio": "832x480",
  "shot_plan": [
    {
      "shot_number": 1,
      "duration_seconds": 1.5,
      "visual_prompt": "hand enters frame and places bottle on counter",
      "camera_trajectory": "gentle push-in",
      "quality_notes": "keep background clean and product readable"
    }
  ],
  "brand_integration_notes": "product should remain readable and naturally lit",
  "caption_angle": "quiet luxury morning ritual"
}
```

## Best use
Use these outputs as the structured bridge between:
- trend references
- safe creative transformation
- render prompt generation
- later storage / approval / publishing steps
