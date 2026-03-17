# Hybrid Video Upgrade Roadmap

## Goal
Upgrade this project from a working but low-motivation self-hosted prototype into a **high-quality hybrid commercial video pipeline**.

This roadmap assumes:
- current local/self-hosted pipeline is useful for automation testing
- premium visual quality should be proven with stronger market-leading models
- scalable automation should remain centered around n8n

---

## Executive recommendation
Use a **hybrid stack**:

### Quality ceiling layer
Use top-tier hosted models for premium demo output:
- `Veo 3.1`
- `Runway Gen-4.5`
- optionally `Kling 3.0`

### Scalable automation layer
Use self-hosted/open workflows for orchestration and lower-cost iteration:
- `n8n`
- `ComfyUI`
- future upgrade to `Wan 2.6` or `HunyuanVideo 1.5`

### Product fidelity layer
Use product-aware control rather than pure text-only generation:
- image-conditioned generation
- reference images
- product insertion / compositing
- BrandFusion-style workflows where appropriate

---

## Current state

### What is working
- prompt-to-video rendering is technically working
- n8n orchestration exists
- agent prompts exist
- reference-safe trend analysis direction exists

### What is not good enough yet
- current WAN-based outputs are not premium enough for strong product motivation
- pure text-to-video product shots are unreliable
- no production-ready polling, download, storage, approval, or publishing loop yet
- no real product-image-conditioned workflow yet

---

## Target architecture

### Final target stack
1. Trend reference intake
2. Reference-safe mechanics extraction
3. Original brief generation
4. Shot plan generation
5. Render path selection
   - hosted premium path for flagship outputs
   - self-hosted path for scale/testing
6. Product fidelity enhancement
   - reference image conditioning or compositing
7. QA gate
8. Asset storage
9. Approval workflow
10. Publish / outreach / analytics

---

## Phase 1 — Stabilize the current system
**Goal:** make the current system operational and measurable.

### Tasks
- keep [workflows/Stealth_AI_Ad_Agency_Pipeline_Tier_4_FIXED.json](../workflows/Stealth_AI_Ad_Agency_Pipeline_Tier_4_FIXED.json) as the current base render workflow
- keep [workflows/reference_safe_trend_to_brief_pipeline.json](../workflows/reference_safe_trend_to_brief_pipeline.json) as the upstream planning workflow
- add render polling after `prompt_id`
- add final asset download
- upload outputs to Drive or S3
- send approval message via Slack or Telegram

### Deliverable
One workflow that can:
- generate
- wait for completion
- fetch final asset
- store final asset
- send review link

### Success criteria
- no manual hunting for output files
- every render has stored metadata
- every run has a downloadable final asset

---

## Phase 2 — Prove premium quality fast
**Goal:** stop relying on weak local outputs as the motivation benchmark.

### Best option
Create a separate **premium demo lane** using hosted best-in-class tools.

### Recommended order
1. `Veo 3.1`
2. `Runway Gen-4.5`
3. `Kling 3.0`

### What to make
Produce 3 to 5 short flagship videos:
- skincare/luxury lifestyle
- beverage/fitness lifestyle
- watch/jewelry lifestyle
- coffee or kitchen premium lifestyle
- one cinematic narrative stealth-ad example

### Rules
- use reference images where available
- keep clips short and deliberate
- aim for product-adjacent lifestyle, not pure text-only hero packshots
- store the best outputs as sales portfolio assets

### Deliverable
A small portfolio proving the business can create high-end creative quality.

### Success criteria
- at least 3 clips that feel client-presentable
- usable for outreach and pitch decks

---

## Phase 3 — Upgrade the self-hosted quality path
**Goal:** improve the long-term scalable backend.

### Replace or augment current model path
Current path is too weak for premium product work.

### Recommended upgrade order
1. `Wan 2.6`
2. `HunyuanVideo 1.5`
3. image-to-video / reference-driven variants

### Why
- `Wan 2.6` is a more realistic evolutionary upgrade from current WAN usage
- `HunyuanVideo 1.5` is a stronger serious open-model direction for quality
- pure text-only generation should be deprioritized for product fidelity

### Infrastructure note
`HunyuanVideo` class models may require much heavier GPU infrastructure than your current setup.

### Deliverable
A better self-hosted render lane for testing and scale.

### Success criteria
- visibly improved realism
- fewer geometry failures
- better motion consistency

---

## Phase 4 — Add product fidelity control
**Goal:** get closer to actual commercial brand output.

### Best strategy
Do not rely on text alone for exact product appearance.

### Add these capabilities
- product reference image input
- first frame / last frame control where supported
- image-conditioned product shot generation
- compositing / insertion workflow
- consistent brand placement notes from the strategist layer

### Practical rule
Use video generation for:
- environment
- motion
- scene mood
- cinematic setup

Use reference or insertion for:
- exact product shape
- label readability
- packaging fidelity
- sponsor-safe deliverables

### Deliverable
A workflow that combines generated scenes with real product fidelity.

### Success criteria
- product looks recognizable
- brand placement is readable
- output is usable in client-facing mockups

---

## Phase 5 — Build the full approval and publishing loop
**Goal:** make it operational, not just creative.

### Add
- QA scoring
- originality check
- derivative risk notes
- cloud storage organization
- approval status tracking
- caption/title generation
- outreach-ready packaging

### Best storage structure
- `/references`
- `/briefs`
- `/renders/raw`
- `/renders/final`
- `/captions`
- `/client_samples`

### Deliverable
An end-to-end content ops system.

### Success criteria
- every video is traceable
- every asset has metadata
- every approved output is ready for sales or posting

---

## Phase 6 — Monetization system
**Goal:** convert the pipeline into a business engine.

### Use existing assets
- [client_outreach/email_templates.md](../client_outreach/email_templates.md)
- [content/viral_niches_and_prompts.md](../content/viral_niches_and_prompts.md)

### Best go-to-market motion
1. build 5 to 10 premium samples
2. group them by niche
3. attach clear before/after or concept notes
4. send outreach to e-commerce brands
5. sell either:
   - one-off creative packs
   - monthly short-form ad retainers
   - stealth-ad concept testing packages

### Deliverable
A repeatable outreach engine tied to actual samples.

---

## Immediate priority list

### Priority 1
Connect the brief workflow to the current render workflow.

### Priority 2
Add polling, download, and cloud upload.

### Priority 3
Create a hosted premium demo lane outside the current self-hosted stack.

### Priority 4
Add product reference input support.

### Priority 5
Upgrade the self-hosted model path.

---

## Best model choices by purpose

### Best for top-end motivation output
- `Veo 3.1`

### Best for pro creative workflow
- `Runway Gen-4.5`

### Best self-hosted upgrade direction
- `HunyuanVideo 1.5`

### Best evolutionary upgrade from your current stack
- `Wan 2.6`

### Best method for product realism
- image-conditioned generation + product insertion/compositing

---

## What not to do
- do not judge the whole business using current WAN 5B-quality outputs
- do not overinvest in pure text-only product hero shots
- do not fully automate publishing before quality and asset retrieval are stable
- do not treat placeholder workflows as production-ready

---

## Recommended next build step
The highest-value next implementation step is:

**Build an end-to-end n8n workflow that takes the structured render brief, renders the video, polls for completion, downloads the result, uploads it to storage, and sends an approval link.**

After that, build the hosted premium demo lane.

---

## Final recommendation
For this project, the best path is not “all self-hosted immediately.”

The best path is:
- hosted models for quality proof
- self-hosted stack for orchestration and scale
- product reference control for fidelity
- n8n as the system backbone

That gives you the fastest route to both:
- believable premium output
- scalable business automation
