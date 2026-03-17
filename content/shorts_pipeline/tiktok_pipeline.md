# 🎵 TikTok Viral Shorts Pipeline
## Step-by-Step Production & Publishing System

---

## 🧠 TikTok Algorithm Rules (2026)

Understanding TikTok's algorithm is mandatory before producing any content:

1. **Watch Time %** — Most important signal. Videos that are rewatched or watched 100% get distributed aggressively.
2. **Shares** — Second most powerful signal. Shares send the video to an entirely new audience graph.
3. **Comments** — Third. Controversial or curiosity-gap content generates comments. Positive sentiment is rewarded.
4. **Saves** — Underrated. "Save to watch later" tells the algorithm the content has high value.
5. **Follows from video** — The algorithm tests your video with a small batch. If watch time is high, it expands. If people follow from it, it expands massively.

**What KILLS TikTok reach:**
- First 3 seconds with no movement or hook
- Videos that look obviously AI-generated with no creative angle (AI Slop penalty)
- Reposting the same video more than once
- No captions or on-screen text (most TikTok is watched muted)
- Posting at wrong times for your timezone

---

## 🏗️ FULL TIKTOK PIPELINE

### Phase 1: Trend Intelligence (Automated — Research Agent)

**Trigger:** n8n cron job every 6 hours  
**Agent:** Research Agent (OpenClaw) or n8n HTTP Request Node

```
Sources to scrape:
1. TikTok Creator Search Insights (free tool in TikTok app)
2. TikTok Trending Hashtags API
3. Twitter/X trending topics (cross-platform correlation)
4. Google Trends (1-hour interval data)
5. Reddit r/trendingsubreddits

Output: JSON file with:
- Top 5 trending audio IDs
- Top 5 trending topic keywords
- Trending hashtag clusters
- Niche correlation score (which of our 11 niches fits the trend)
```

**n8n Node Setup:**
```
[Schedule Trigger: Every 6h]
  → [HTTP Request: TikTok Creator API]
  → [HTTP Request: Google Trends API]
  → [Set Node: Format trend data]
  → [Write File: /trends/todays_trends.json]
  → [Trigger: Content Generation Webhook]
```

---

### Phase 2: Content Package Generation (Content Agent)

**Trigger:** Receives trend data from Phase 1  
**Agent:** Content Agent (OpenClaw / DeepSeek V4)

**System Prompt Injection:**
```
Trend data: {{todays_trends.json}}
Niche library: {{viral_niches_and_prompts.md}}
Platform target: TikTok

Generate 3 content packages. Each must include:
1. Hook (first 3 words that appear on screen)
2. 20-30 second script (no longer)
3. Video generation prompt (8-element formula)
4. Caption (max 150 chars + 5 hashtags)
5. Audio suggestion (trending sound name or AudioLDM description)
6. AB hook variant (2 options)
7. Model recommendation (Wan 2.6 / Kling 3.0 / Veo 3.1)
```

**Output Example:**
```json
{
  "package_id": "tiktok_20260318_001",
  "niche": "Industrial/Welding",
  "trend_matched": "#satisfying #sparks",
  "hook": "Nobody films this...",
  "hook_variant_b": "Most dangerous job alive ⚠️",
  "script": "0-3s: Arc welding sparks cascade in slow motion. 3-8s: Pull back to reveal massive ship hull. 8-15s: Worker's face reflected in visor. 15-20s: Caption: 'Who builds the ships that carry your packages?' 20-25s: Logo/CTA",
  "video_prompt": "A skilled welder arc welding a massive ship hull at night, thousands of sparks cascading toward camera in extreme slow motion, industrial dock at night, sodium flood lighting, low-angle dolly shot from ground level slowly pulling back to reveal full 300m vessel, 4K cinematic, hyper-realistic, shallow depth of field on sparks",
  "negative_prompt": "static frame, blurry, overexposed, subtitles",
  "caption": "Nobody talks about the people building your world 🌊⚓ #shipbuilding #welding #satisfying #industrial #skilled",
  "audio_suggestion": "Trending: 'Epic Cinematic Build' sound or AudioLDM: deep industrial bass drone with spark metallic ping",
  "model": "Wan 2.6 (Tier A free) or Kling 3.0 (Tier B premium)",
  "render_tier": "A",
  "requires_human_approval": true
}
```

---

### Phase 3: Video Render (ComfyUI / API)

**Tier A (Wan 2.6 on Vast.ai — Free)**
```
n8n HTTP Request → ComfyUI API (Vast.ai endpoint)
Payload: video_prompt from Phase 2
Resolution: 1080x1920 (9:16 vertical)
Duration: 4-8 seconds (loop 3-4x for 20s total feel)
Model: Wan 2.6 14B
```

**Tier B (Kling 3.0 API — ~$0.40/gen)**
```
n8n HTTP Request → Kling API
Mode: multi_shot (up to 6 shots in one generation)
Resolution: 1080x1920
Duration: 15s native
Feature: AI Director automatically handles transitions
```

**Tier C (Veo 3.1 API — ~$5/gen)**
```
n8n HTTP Request → Google Veo API (via Vertex AI)
Resolution: 2160x3840 (4K vertical)
Duration: up to 25s with native audio
Output: MP4 with embedded audio track
```

---

### Phase 4: Audio Assembly

**Option A: AudioLDM (Free, local)**
```
Input: Audio description from content package
Output: 20-30s audio track matching video mood
Then: VHS VideoCombine node merges video + audio
```

**Option B: TikTok trending audio (Highest virality)**
```
Download trending sound from TikTok
Add in CapCut or DaVinci with volume duck under voiceover
Note: Always verify commercial rights before using trending audio for branded content
```

**Option C: ElevenLabs voiceover (~$0.30/min)**
```
Input: Script from Phase 2
Output: Realistic AI voiceover
Best for: Educational/documentary style TikTok videos
```

---

### Phase 5: Post-Processing Checklist

Before posting, run through this checklist every time:

- [ ] **9:16 verified** — No letterbox bars
- [ ] **First 3 frames** — Motion is present in frame 1
- [ ] **Auto-captions added** — Use CapCut or TikTok native captions
- [ ] **Hook text overlay** — First 3 words visible as text on screen
- [ ] **Audio is synced** — Check audio/video alignment at every cut
- [ ] **No watermarks** — No tool watermarks visible
- [ ] **Duration check** — 15-30 seconds for maximum completion rate
- [ ] **Caption finalized** — Under 150 characters + 5 relevant hashtags

---

### Phase 6: Human Approval Queue

All videos land in a draft queue before posting. Human reviews in under 30 seconds:
- ✅ Approve → Goes to Phase 7 (scheduled publish)
- ❌ Reject → Flagged back to Content Agent with rejection reason
- ✏️ Edit → Open in CapCut for quick adjustments

---

### Phase 7: Scheduled Publish (n8n → TikTok API)

```
n8n Schedule Node: 
  - 7:30 AM (morning peak)
  - 12:30 PM (lunch peak)  
  - 7:30 PM (evening peak)

TikTok API Payload:
{
  "video_file": "/renders/output_001.mp4",
  "caption": "{{package.caption}}",
  "privacy_level": "PUBLIC",
  "duet_disabled": false,
  "stitch_disabled": false,
  "allow_comment": true
}
```

---

### Phase 8: Performance Monitoring (Research Agent — 24h later)

**Data pulled:**
- Views in first 6h / 24h / 72h
- Watch time % (critical — target >60%)
- Share count (target >0.5% of views)
- Follower gain from video
- Comments sentiment

**Memory Agent stores:**
- Winning hooks → added to `hook_library.md`
- Winning niches → upweighted in next trend analysis
- Failing formats → downweighted

**Escalation Triggers:**
- Video hits 50K views in 24h → Supervisor Agent creates Tier B follow-up package
- Video hits 200K views → Outreach Agent drafts brand deal pitch for relevant sponsors

---

## 📊 TikTok KPIs & Targets

| Metric | Poor | Average | Good | Viral |
|---|---|---|---|---|
| 24h Views | <1,000 | 1K-10K | 10K-100K | 100K+ |
| Watch Time % | <30% | 30-50% | 50-70% | 70%+ |
| Share Rate | <0.1% | 0.1-0.5% | 0.5-2% | 2%+ |
| Growth Rate | <10/day | 10-100/day | 100-1000/day | 1000+/day |
