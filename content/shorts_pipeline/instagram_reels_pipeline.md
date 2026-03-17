# 📸 Instagram Reels Pipeline
## Step-by-Step Production & Publishing System

---

## 🧠 Instagram Reels Algorithm Rules (2026)

Instagram's algorithm in 2026 has significantly evolved:

1. **Sends (DMs)** — The single strongest signal. A video people send to friends gets massive distribution. Design FOR sharing.
2. **Saves** — Second strongest. "Save for later" means high-value, bookmark-worthy content.
3. **Watch Time %** — Instagram strongly rewards 100% watch completion and replays.
4. **Comments quality** — Long comments > short comments. Questions in your caption drive comment quality.
5. **Accounts Reached** — Instagram actively pushes Reels to non-followers if early engagement is strong.

**Platform Character in 2026:**
- Instagram skews **premium and aspirational** — luxury, fashion, lifestyle
- **Aesthetic quality matters more here** than on TikTok
- **Product sell-through** (people actually buying through Instagram) remains the highest of all platforms
- Reels now reach non-followers MORE aggressively than TikTok (better for new accounts)

**What KILLS Instagram reach:**
- Low video resolution (always 1080p minimum)
- Placing important content in the bottom 20% (cover buttons)
- Heavy text overlays that Instagram's AI reads as spam indicators
- Cross-posting TikTok videos with TikTok watermark (Instagram actively penalizes this)

---

## 🏗️ FULL INSTAGRAM REELS PIPELINE

### Phase 1: Trend + Competitor Research (Research Agent)

**Instagram-Specific Research:**
```
1. Monitor top 10 competitor accounts weekly (browser read-only scrape)
2. Track Instagram Explore page topics (by niche)
3. Monitor which Reels are getting "Feature" placement by Meta
4. Track trending Reels audio in target niche (via Reels audio browser)
5. Research brand collaborations in niche (who is paying for content)

Output JSON:
{
  "top_performing_formats": ["Transformation", "POV", "Luxury Reveal"],
  "competitor_top_reels": [...],
  "trending_audio": [...],
  "hot_brand_categories": ["supplements", "watches", "luxury cars"]
}
```

---

### Phase 2: Content Package Generation (Content Agent)

**Instagram Reels Script Formula:**
```
[0-2s]  VISUAL HOOK: Strongest possible first frame (no title card, no logo)
[2-8s]  VISUAL STORY: Show don't tell — let the image do the work
[8-20s] BUILD: Increase tension or aspiration
[20-30s] PAYOFF: The satisfying reveal, transformation, or emotional peak
```

**Instagram-Specific Principles:**
- **No talking head in first 2 seconds** — Open with a visual event
- **Color grade matters** — Slightly desaturated shadows + boosted highlights = "Premium Instagram aesthetic"
- **Text overlays: use sparingly** — 1 line max, large font, centered, appears at the climax not the beginning
- **Trending audio is more important than on YouTube** — Always sync to a trending track

**Content Package for Instagram:**
```json
{
  "platform": "Instagram Reels",
  "format": "Luxury Reveal",
  "visual_hook_description": "First frame: extreme close-up of sparks falling into dark water",
  "video_prompt": "An ultra-premium close-up of arc welding sparks cascading in extreme slow motion toward the camera, dark ship hull background, warm orange sparks against cool blue water reflections, cinematic beauty shot, bokeh on background, vertical 9:16, 4K Kling 3.0",
  "color_grade_instruction": "Lift shadows slightly, desaturate midtones -15, boost highlight warmth +20, add subtle film grain",
  "audio_suggestion": "Trending: [Search 'cinematic build' in Reels audio browser] — slow build to drop at 15-second mark",
  "caption": "The precision that holds the ocean back. 🌊⚓\n\nWho builds the infrastructure powering the world?\n\n#shipbuilding #engineering #welding #craftsmanship #industrial",
  "cta_in_caption": "Send this to someone who works with their hands 🙏",
  "brand_placement": "Subtle brand logo appears on welder's helmet at 22s during close-up",
  "collab_tags": "@[brand_tag] [if applicable]",
  "model_recommendation": "Kling 3.0 (photorealism + 4K needed for Instagram audience)",
  "render_tier": "B"
}
```

---

### Phase 3: Premium Video Render

**Instagram demands highest visual quality of the three platforms:**

- **Kling 3.0** — Best choice for most Reels content  
  - Native 4K, photorealistic humans, lip-sync if needed
  - "AI Director" multi-shot: automatically chains 3-6 shots for 15s Reel
- **Veo 3.1** — For broadcast-tier luxury/brand content  
  - Native audio + 4K
  - Use for: fashion, architecture, luxury car Reels sold to premium clients

**Color Grading (Critical Step):**
Instagram audiences are highly attuned to aesthetic quality. Every reel needs:
```
Step 1: Export raw render from ComfyUI/API
Step 2: Open in DaVinci Resolve (free) or CapCut Pro
Step 3: Apply these adjustments:
  - Lift: +5 (prevents crushed blacks)
  - Gamma: -8 (slight darkening for mood)
  - Highlights: +15 warmth (golden)
  - Shadows: +10 cool (teal)
  - Saturation: -10 globally, +20 on orange/red channel only
  - Grain: Film grain at 15% opacity for analog feel
```

---

### Phase 4: Audio Strategy

**Option A: Trending Reels Audio (Best for algorithmic reach)**
```
1. Research Agent finds audio trending in niche
2. Download original audio from creator's Reel (save from Instagram)
3. Add at appropriate volume underneath visuals
4. Remix/edit if needed to match visual timing
Risk: Cannot monetize videos using trending audio for brand deals
```

**Option B: Licensed Original Music (Best for brand content)**
```
Sources:
- Artlist.io (best library, ~$199/year — unlimited)
- Epidemic Sound (~$15/month)
- Musicbed (premium, used by major brands)
Note: Required for any brand-paid content or sponsored posts
```

**Option C: AI-Generated Original Score (Best for owned content)**
```
Tools: Suno AI, Udio AI, AudioLDM (local)
Input: "Cinematic, industrial, powerful, building tension, 30 seconds, no vocals"
Output: Custom track that perfectly matches your visual
Advantage: 100% owned, no licensing risk
```

---

### Phase 5: Posting Optimization

**Content-Specific Caption Templates:**

*Aspirational/Luxury:*
```
[Bold statement that creates FOMO]

[1-2 sentence story or fact]

[Question to drive comments]

[5 highly targeted hashtags]
[Soft CTA: "Send this to someone who needs to see it"]
```

*Educational/Informational:*
```
[Surprising fact as opener]

[3-bullet value delivery]

[Comment hook: "What shocked you about this?"]

[5 hashtags]
```

**Hashtag Strategy:**
- Use 5 hashtags maximum (Instagram 2026 recommendation)  
- Mix: 1 mega (10M+) + 2 medium (500K-5M) + 2 niche (50K-500K)
- NOT: all mega hashtags (you get lost) or all niche (limited reach)

**First Comment Strategy:**
Immediately after posting, add a first comment with:
- The question you want people to answer
- 5 additional hashtags (different from caption hashtags)
- This doubles your hashtag coverage without looking spammy

---

### Phase 6: Story Amplification

Every Reel should be reposted to Stories within 2 hours:
```
Story format:
- Add a "Swipe Up" sticker or Poll sticker ("Would you work this job? YES / NO")
- Post to Close Friends first (signals high-quality initial audience to algorithm)
- Add a location tag if relevant
- @mention any relevant accounts

Result: Stories push Reel to existing followers → triggers algorithmic distribution to non-followers
```

---

### Phase 7: Collaboration + Brand Deal Detection (Research + Outreach Agents)

When a Reel hits **50K+ views in 48 hours:**

**Research Agent automatically:**
1. Identifies brands most associated with the niche
2. Pulls contact info for their marketing/partnership teams
3. Notes CPM rates for the niche

**Outreach Agent automatically drafts:**
```
Subject: Re: [BRAND NAME] — partnership opportunity (180K+ views organically)

Hi [Name],

Our recent Reel on [NICHE] reached [X] views organically in [Y] hours —
[% of audience] are [demographic match].

We create [X] pieces of content per week in this exact niche and our engagement 
rate is [Y]% — [X] times the industry average.

Would you be open to a 15-minute call to explore a content partnership?

[Signature]

[requires_human_approval: true]
```

---

## 📊 Instagram Reels KPIs

| Metric | Poor | Average | Good | Viral |
|---|---|---|---|---|
| 48h Views (non-followers) | <3,000 | 5K-30K | 30K-300K | 300K+ |
| Saves Rate | <0.5% | 0.5-2% | 2-5% | 5%+ |
| Sends (DM shares) | <0.1% | 0.1-1% | 1-3% | 3%+ |
| Profile Visits from Reel | <200 | 200-1000 | 1K-5K | 5K+ |
| Follower Conversion | <0.5% of viewers | 0.5-2% | 2-5% | 5%+ |
