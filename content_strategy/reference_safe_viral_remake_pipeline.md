# Reference-Safe Viral Remake Pipeline

## Goal
Build a pipeline that uses trending videos as **reference inputs** for hook, pacing, shot structure, and emotional mechanics, while generating a **new original commercial video** that avoids direct copying.

## Core principle
Do not recreate a source video shot-for-shot.

Use source content only to extract:
- hook pattern
- pacing pattern
- shot rhythm
- scene transitions
- emotional trigger
- visual structure

Generate new output with:
- different setting
- different subject
- different copy/script
- different product context
- different camera specifics
- different visual details

---

## Recommended architecture

### Stage 1 — Trend ingestion
Input sources:
- TikTok trend feeds
- YouTube Shorts trend feeds
- Instagram/Reels trend lists
- manual URL drop for testing

Data collected:
- source URL
- platform
- title/caption
- author handle
- engagement metrics
- transcript if available
- thumbnail

Output schema:
```json
{
  "source_url": "https://...",
  "platform": "tiktok",
  "title": "...",
  "creator": "...",
  "views": 1200000,
  "likes": 98000,
  "transcript": "...",
  "thumbnail_url": "..."
}
```

### Stage 2 — Reference extraction
Extract from the viral source:
- opening hook pattern
- average shot duration
- number of cuts
- emotional progression
- visual environment type
- subject type
- camera energy
- CTA pattern if present

What to avoid extracting literally:
- exact wording
- identifiable faces
- logos
- brand names
- exact background details
- exact shot order when too distinctive

Output schema:
```json
{
  "hook_type": "contrarian confession",
  "pacing": {
    "avg_shot_seconds": 1.8,
    "cut_count": 6,
    "energy_curve": ["high", "medium", "high"]
  },
  "visual_mechanics": {
    "environment_type": "kitchen counter",
    "camera_style": "fast push-in and handheld closeups",
    "scene_pattern": [
      "hook close-up",
      "demonstration shot",
      "reaction shot",
      "product payoff"
    ]
  },
  "copyright_risk_notes": [
    "do not reuse source phrasing",
    "avoid same prop arrangement",
    "avoid copying creator identity"
  ]
}
```

### Stage 3 — Safe transformation layer
Transform the reference into a new creative brief.

Rules:
- keep mechanism, not expression
- preserve the emotional engine, not the original scenes
- substitute niche, setting, props, and copy
- shift the product use-case to a new context

Example:
- source: person ranting about productivity in a dark bedroom
- transformed output: elegant morning skincare or coffee ritual with a different emotional angle

Output schema:
```json
{
  "new_angle": "small luxury ritual before work",
  "new_setting": "sunlit bathroom vanity",
  "new_subject": "woman preparing for the day",
  "product_role": "hero object placed naturally during routine",
  "style_constraints": [
    "balanced exposure",
    "soft contrast",
    "clean composition",
    "simple believable motion"
  ]
}
```

### Stage 4 — Script generation
Generate:
- new hook
- new script
- voiceover text
- caption package

Rules:
- no lifted lines from source
- no paraphrase that is too close
- same emotional category is okay
- same pacing is okay
- same literal wording is not okay

Output schema:
```json
{
  "hook": "I stopped buying random skincare and started doing this instead.",
  "script": "...",
  "voiceover": "...",
  "caption": "...",
  "hashtags": ["#skincare", "#beautyroutine"]
}
```

### Stage 5 — Shot plan generation
Creative planner produces:
- 3 to 6 shots max
- durations
- scene prompts
- camera movement
- product placement moment
- quality notes

Rules for best model quality:
- one clear subject
- simple action
- believable environment
- short clip lengths
- avoid complex crowds and fast motion

Output schema:
```json
{
  "master_visual_direction": "premium lifestyle commercial, realistic and clean",
  "shots": [
    {
      "shot_number": 1,
      "duration_seconds": 1.5,
      "purpose": "hook",
      "visual_prompt": "close-up of a hand placing a serum bottle on a marble counter",
      "camera": "gentle push-in",
      "product_visibility": "partial",
      "quality_notes": "soft daylight, clean background"
    }
  ]
}
```

### Stage 6 — Render strategy
Best order of render options:

1. **Lifestyle T2V**
- use for mood, scene, action, cinematic movement
- best when product does not need exact geometry

2. **Image-conditioned generation**
- use when product shape matters
- preferred for product realism

3. **Compositing / BrandFusion layer**
- use when exact product fidelity matters most
- best for sponsor/client work

Recommendation:
- do not rely on pure text-only T2V for hero product shots
- use text-only T2V mainly for background/lifestyle scenes
- insert or condition with the actual product image later

### Stage 7 — QA gate
Reject outputs if:
- copied too closely to source
- product unreadable
- warped geometry
- weird hands
- over-contrasty grading
- broken continuity
- corrupt or too-short output

QA schema:
```json
{
  "approved": true,
  "reason": "original enough and visually usable",
  "flags": [],
  "quality_score": 7.8,
  "derivative_risk_score": 2.1
}
```

### Stage 8 — Storage and publishing
Store:
- source reference metadata
- extracted mechanics
- transformed creative brief
- prompts used
- final render
- caption package
- approval status

Publish only after:
- originality check
- brand safety check
- quality approval

---

## n8n workflow recommendation

### MVP flow
1. Manual or API trend ingest
2. Transcript/frame metadata extraction
3. Content Strategy Agent
4. Creative Director Agent
5. Brand Strategist Agent
6. JSON parser / validator
7. ComfyUI render
8. Poll `prompt_id`
9. Download output
10. QA review
11. Upload to Drive/S3
12. Approval
13. Publish or outreach use

### Best node groups
- `Trend Intake`
- `Reference Analyzer`
- `Safe Transformer`
- `Script Generator`
- `Shot Planner`
- `Render`
- `Render Poller`
- `Asset Downloader`
- `QA Gate`
- `Storage`
- `Approval`
- `Publisher`

---

## Legal and policy guardrails
Always avoid:
- direct frame recreation
- source creator likeness cloning
- copied script wording
- copied branded context
- copied exact prop layout if distinctive
- identical scene progression when highly recognizable

Safe target:
- same viral mechanic
- different expression

---

## Best practical option for this repo
For this project, the best immediate production path is:

1. ingest trending videos as references only
2. extract mechanics into JSON
3. transform into a new lifestyle product brief
4. render a clean lifestyle scene
5. use product image insertion or compositing for exact brand fidelity
6. store outputs and send approval link

This is safer, more controllable, and more commercially useful than trying to clone the original viral video directly.

---

## Milestone plan

### Milestone 1
Reference-safe MVP
- manual trend URL input
- transcript extraction
- mechanics extraction
- new script generation
- one clean rendered output

### Milestone 2
Productionized render loop
- prompt polling
- download final asset
- upload to cloud storage
- approval workflow

### Milestone 3
Product fidelity upgrade
- image-conditioned generation or BrandFusion insertion
- brand-safe QA

### Milestone 4
Monetization loop
- sample generation
- outreach automation
- performance tracking

---

## Recommendation
Do not build a direct remake machine.

Build a **reference-to-original commercial engine**.
That is the strongest path for quality, safety, and client value.
