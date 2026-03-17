# 📺 YouTube Shorts Pipeline
## Step-by-Step Production & Publishing System

---

## 🧠 YouTube Shorts Algorithm Rules (2026)

YouTube Shorts algorithm behaves VERY differently from TikTok:

1. **Click-Through Rate (CTR)** — Thumbnail + title matters heavily even for Shorts. Aim for >8% CTR.
2. **Average View Duration (AVD)** — Target 80%+ watch completion. YouTube rewards finishing watching.
3. **Subscribers Gained** — YouTube rewards videos that convert viewers to subscribers.
4. **Likes/Comments Ratio** — Higher engagement ratio = more distribution.
5. **The Shelf Effect** — YouTube Shorts that perform well get placed on the main YouTube feed, not just Shorts shelf. This is where massive scale comes from.

**Key difference from TikTok:**
- YouTube viewers skew **older (25-45)** — they want educational value or high production quality
- **Titles and descriptions matter** (unlike TikTok where caption is secondary)
- One viral YouTube Short can drive subscribers who then watch your **long-form content** — this creates a content flywheel

---

## 🏗️ FULL YOUTUBE SHORTS PIPELINE

### Phase 1: Keyword + Topic Research (Research Agent)

**Trigger:** Weekly fresh research + daily trend check  
**Agent:** Research Agent (OpenClaw)

```
Research Queries (run via MCP Web Search):
1. YouTube search: "[niche] shorts" → look at 100K+ videos in last 30 days
2. vidIQ / TubeBuddy trend data (read-only browser scrape)
3. Google Keyword Planner: search volume for video topic keywords
4. Answer The Public: what questions people are asking about the niche

Output JSON:
{
  "trending_topics": [...],
  "high_search_volume_keywords": [...],
  "underserved_topics": [...],  ← Gold: high search, low competition
  "best_title_templates": [...]
}
```

**YouTube-Specific Content Strategy:**
- **Educational Short** → "5 facts about X you never knew" (high saves + watch time)
- **Satisfying Process** → "Watching a ship get welded from start to finish" (loop-worthy)
- **Comparison Short** → "Professional welder vs beginner vs AI robot" (comments + controversy)
- **Timelapse Revelation** → Shows a dramatic transformation in 60 seconds

---

### Phase 2: Script Writing (Content Agent)

**YouTube Shorts Script Formula:**
```
[0-3s]  HOOK: Verbal + Visual — Say the most interesting thing first
[3-10s] INTRIGUE: Expand the hook, tease the payoff
[10-45s] CONTENT: Deliver the value/entertainment
[45-58s] PAYOFF: The satisfying conclusion or twist
[58-60s] CTA: "Subscribe for more" or "part 2 if you want it"
```

**Key YouTube difference:** You MUST say the hook out loud in the first 3 seconds. YouTube's algorithm reads speech, not just visual motion. The spoken word "Did you know ships are welded by hand?" is more important than the visual hook.

**Content Package for YouTube:**
```json
{
  "platform": "YouTube Shorts",
  "title": "The Most Dangerous Welding Job in the World 🔥",
  "title_variant_b": "Nobody Films Inside a Shipyard (Until Now)",
  "description": "Ship welding requires insane precision under extreme conditions. Here's what nobody shows you. #shipbuilding #welding #satisfying #skilled #industrial",
  "tags": ["shipbuilding", "welding", "satisfying", "industrial", "vocational"],
  "thumbnail_prompt": "Extreme close-up of arc welding sparks frozen in mid-air over dark water, high contrast, dramatic, text overlay 'The Most Dangerous Job' in bold white uppercase",
  "spoken_hook": "This single weld will hold 50,000 tons together...",
  "video_prompt": "<<8-element cinematic video prompt>>",
  "voiceover_script": "<<full 60-second narration script>>",
  "model_recommendation": "Veo 3.1 for highest quality (YouTube is pixel-peeping audience)",
  "render_tier": "B or C"
}
```

---

### Phase 3: Video Render + Voiceover

**YouTube Viewers Expect Higher Production Quality:**
- Minimum: Wan2.2 1080p
- Recommended: Kling 3.0 or Veo 3.1 for this platform
- Always add: Professional voiceover (ElevenLabs) or genuine human voice

**Voiceover Setup (ElevenLabs):**
```
API: ElevenLabs /v1/text-to-speech
Voice: "Adam" (authoritative) or "Rachel" (clear and warm)
Style: Conversational, not robotic. Pace: Slightly slower than normal speech.
Post-process: Light compression + EQ in Audacity (free) before merging
```

**Auto-Subtitle Burn-In:**
YouTube Shorts viewers often watch muted at first, then unmute:
1. Generate subtitles using Whisper (local AI transcription — free)
2. Style: Bold white text, center-bottom, black drop shadow
3. Burn into video using FFmpeg: `ffmpeg -i input.mp4 -vf subtitles=subs.srt output.mp4`

---

### Phase 4: Thumbnail Creation (AI-Generated)

Every YouTube Short needs a custom thumbnail even though the platform auto-selects:
```
Thumbnail Generator Workflow:
1. Content Agent writes a thumbnail description
2. FLUX Image Generator creates image (via ComfyUI or FLUX API)
3. Add bold text overlay in Canva or Photoshop
4. A/B test two thumbnails (upload both, YouTube shows winner)

Thumbnail Formula:
- High contrast between subject and background
- ONE clear focal point
- Bold text (max 5 words, must be readable at thumbnail size)
- Strong emotion on face if human is present
- Red or yellow color accents statistically increase CTR
```

---

### Phase 5: SEO Optimization (Research Agent)

**YouTube SEO Checklist:**
- [ ] Title contains primary keyword in first 40 characters
- [ ] Description first line repeats the title keyword
- [ ] 10-15 targeted tags (mix high and low competition)
- [ ] Custom thumbnail uploaded (not auto-selected)
- [ ] End screen configured (even on Shorts — drives to long-form)
- [ ] Chapter markers if over 30 seconds
- [ ] Pinned comment with secondary CTA

**n8n node: Auto-fill YouTube metadata**
```
[Content Package JSON]
  → [AI SEO Agent: generate optimal title/description/tags]
  → [YouTube Data API v3: upload video with metadata]
  → [YouTube API: upload thumbnail]
  → [YouTube API: add to playlist]
```

---

### Phase 6: Publish Schedule + Community Posts

**Optimal YouTube Shorts Schedule:**
- Post frequency: 1-2 Shorts per day (consistency beats volume on YouTube)
- Best days: Monday, Wednesday, Saturday
- Best times: 9AM, 3PM, 8PM (local timezone)

**24 Hours After Posting — Community Post:**
Create a text Community Post linking to the Short:
```
"New Short just dropped — the one thing about shipyard welding that surprised me most 👇
[link]
What do YOU do for work? Drop it below 🔽"
```
Community posts extend the video's life and bring a second wave of traffic.

---

### Phase 7: Performance Analysis + Iteration (Research Agent)

**YouTube Studio API Data Points:**
```json
{
  "views_24h": 12400,
  "avg_view_duration_percent": 73,
  "impressions": 45000,
  "ctr_percent": 8.2,
  "subscribers_gained": 87,
  "likes": 342,
  "comments": 28,
  "shares": 15
}
```

**Iteration Rules:**
- CTR < 5% → Fix thumbnail and title, retest
- AVD < 50% → Fix the first 5 seconds
- Good CTR + Bad AVD → Hook is clickbait, content doesn't deliver (worst case)
- Both CTR > 8% + AVD > 65% → SCALE. Make 3 more videos in same format immediately

---

## 📊 YouTube Shorts KPIs

| Metric | Poor | Average | Good | Viral |
|---|---|---|---|---|
| 48h Views | <2,000 | 2K-20K | 20K-200K | 200K+ |
| avg View Duration % | <40% | 40-60% | 60-80% | 80%+ |
| CTR (impressions) | <3% | 3-6% | 6-10% | 10%+ |
| Subscribers Gained | <10/video | 10-100 | 100-500 | 500+ |
