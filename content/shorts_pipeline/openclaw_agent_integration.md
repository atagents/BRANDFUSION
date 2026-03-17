# 🤖 OpenClaw Agent Integration Map
## How Each Agent Powers the Viral Shorts Machine

*This document shows exactly what each OpenClaw agent does at each stage of the viral shorts pipeline.*

---

## The Agent-Pipeline Integration Map

```
PIPELINE STAGE              AGENT               ACTION
─────────────────────────────────────────────────────────────────────
Trend Discovery (6h)   →  Research Agent   →  Scrapes TikTok + Google + Reddit
Content Generation     →  Content Agent    →  Writes hook, prompt, caption, CTA
Brand Research         →  Research Agent   →  Pulls competitor analysis
Video Render Trigger   →  Content Agent    →  Calls ComfyUI API (Vast.ai)
Performance Tracking   →  Research Agent   →  Polls YouTube/TT/IG API 24h later
Memory + Learning      →  Memory Agent     →  Stores winning hooks + formats
Brand Deal Detection   →  Research Agent   →  Finds matching brands when viral
Outreach Drafting      →  Outreach Agent   →  Writes partnership pitch emails
Budget Decisions       →  Supervisor       →  Upgrades tier A→B→C when ROI justifies
Daily Briefing         →  Memory Agent     →  Summarizes opportunities + tasks
```

---

## Agent 1: Research Agent in Shorts Production

### Daily Trend Scan (6AM, 12PM, 6PM)
**Triggered by:** n8n Schedule Node  
**Output saved to:** `/trends/daily_trend_report.json`

```
TASK: Trend Discovery
Query 1: "What are the top 5 trending topics on TikTok right now in the [niche] space?"
Query 2: "What YouTube Shorts keywords have high search volume but low competition in [niche]?"
Query 3: "What sounds are trending on Instagram Reels in [niche] this week?"
Query 4: "Are there any viral competitor videos in [niche] posted in the last 48 hours I should know about?"

MCP Tools Used: mcp_web_search, mcp_browser_readonly
```

### 24h Performance Pull
**Triggered by:** 24h after each video posts  
**Platforms:** TikTok Analytics API, YouTube Data API, Instagram Graph API

```
DATA COLLECTED:
- Views, watch time %, share rate, save rate
- Follower gain attributed to video
- Comments sentiment (positive/negative/neutral)
- CTR (YouTube only)

AGENT ACTION:
IF views_24h > 50,000:
  → Flag as "Winner" → Notify Supervisor
  → Store winning hook in Memory Agent
  
IF views_24h < 1,000:
  → Flag as "Underperformer"
  → Note what did NOT work (tag format, hook type, niche)
  → Adjust next batch weighting
```

### Weekly Competitor Report
**Triggered by:** Sunday 8PM  
**Output saved to:** `/research/competitor_report_WEEK.md`

```
RESEARCH TARGETS:
- Top 5 accounts in each active niche
- Track: posting frequency, average views, top format, follower growth rate

DELIVERABLE REPORT:
- "What is working for competitors that we aren't doing?"
- "What opportunity gaps exist (niches they haven't touched)?"
- "Which brands are sponsoring competitor content this week?"
```

---

## Agent 2: Content Agent in Shorts Production

### Full Content Package Generation
**Triggered by:** Trend report from Research Agent  
**Model:** DeepSeek V4 via OpenRouter

**For each platform, Content Agent produces:**

```json
{
  "run_id": "20260318_tiktok_003",
  "platform": "TikTok",
  "niche": "Industrial/Welding",
  "trend_matched": "#satisfying #sparks #industrial",
  "hook": "Nobody lets cameras in here...",
  "hook_variant_b": "The job that scares most people 🔥",
  "video_prompt": "A welder arc welding at night on a ship hull...",
  "negative_prompt": "static, blurry, subtitles...",
  "caption": "What holds the ocean back? 🌊 #shipbuilding #welding...",
  "audio": "AudioLDM: deep industrial drone + metallic spark pings",
  "model": "Wan 2.6",
  "render_tier": "A",
  "requires_human_approval": true,
  "estimated_viral_score": 7.8
}
```

### Hook Library Maintenance
When Memory Agent flags a winning hook, Content Agent:
1. Categorizes it by niche, emotion type, and format
2. Writes 5 variations of the winning hook pattern
3. Adds all to `hook_library.md`
4. Applies the pattern to the NEXT 3 content packages

### AB Test Management
Content Agent always produces 2 hook variants. After 48 hours:
- Research Agent delivers winner data
- Content Agent notes which variant style won (curiosity gap vs. shock vs. FOMO)
- This data shapes future hook writing

---

## Agent 3: Memory Agent in Shorts Production

### What Memory Agent Stores
```
WINNING HOOKS LOG:
{
  "hook": "Nobody lets cameras in here...",
  "niche": "Industrial",
  "platform": "TikTok",
  "views_24h": 187000,
  "hook_type": "Exclusivity + Curiosity Gap",
  "date": "2026-03-18"
}

WINNING FORMATS LOG:
{
  "format": "Slow motion sparks + industrial scale reveal",
  "avg_watch_time_pct": 72,
  "avg_share_rate_pct": 2.1,
  "best_model": "Wan 2.6",
  "best_audio": "Deep industrial drone"
}

FAILING FORMATS LOG:
{
  "format": "Talking head welding tutorial",
  "avg_views": 800,
  "why_failed": "No motion in first frame, educational format wrong for TikTok"
}
```

### Daily Briefing (7AM)
```markdown
### 🌅 Viral Shorts Daily Briefing — 2026-03-19

#### 🔥 Today's Top 3 Priorities:
1. Review 3 content packages in approval queue (generated overnight)
2. Check performance on yesterday's TikTok post (currently at 23K views)
3. Approve outreach draft to FitPro brand (from yesterday's viral video)

#### 📊 Performance Yesterday:
- TikTok "ship sparks" video: 23,400 views (↑ trending)
- YT Shorts "welding facts": 8,200 views (average)
- Instagram Reel "luxury dock": 45,200 views (🔥 winner — save rate 4.1%)

#### 🎯 Opportunities Flagged:
- Instagram Reel is viral → Outreach Agent has drafted partnership pitch for 2 watch brands
- "Exclusivity + curiosity gap" hook is outperforming this week — weight this format higher

#### ✅ Awaiting Your Approval:
- 3 TikTok content packages (30-second review each)
- 2 outreach emails drafted by Outreach Agent
```

---

## Agent 4: Outreach Agent — Brand Deal Automation

### Trigger: Video Hits Viral Threshold

**Research Agent detects:** 50K+ views in 48h  
**Research Agent identifies:** Top 3 brands that align with content niche  
**Outreach Agent drafts:** Partnership pitch for each brand

**Auto-Generated Pitch Template:**
```
Subject: [Brand] × [Your Channel] — 180K views organically in welding niche

Hi [First Name],

Our recent Reel on industrial shipyard welding reached 180,000 views organically 
in 48 hours — with a 4.1% save rate and 2.3% send rate (shares to DMs).

Our audience skews 70% male, 25-45, with high intent to purchase premium tools,
workwear, and equipment.

We publish 3-5 pieces of content per week in this exact niche. Would you be open
to a quick 15-minute conversation about a content integration?

Best,
[Your Name]

[QUEUED FOR HUMAN APPROVAL — NOT YET SENT]
```

---

## Agent 5: Supervisor Agent — Scaling Decisions

When the Supervisor Agent is triggered by performance data:

```
DECISION TREE:

IF video_views_48h > 200K AND platform = TikTok:
  → Upgrade next 3 videos in same niche from Tier A → Tier B
  → Ask Content Agent for 5 variations on winning hook format
  → Alert Outreach Agent to start sponsor research

IF account_followers_growth > 500/week:
  → Recommend creating long-form YouTube content in same niche
  → Suggest establishing brand positioning in that niche

IF API_budget > $50/month:
  → Recommend upgrading to Kling 3.0 for TikTok content
  → ROI calculation: [brand deal potential] / [API cost] = justify upgrade

IF niche_saturation_detected (competitors flooding same format):
  → Alert Research Agent to find next opportunity niche
  → Pause current niche temporarily
```

---

## ⚡ Quick Agent Command Reference

These are the exact natural language commands you can give to each agent:

**Research Agent:**
- "Pull the top 5 trending niches on TikTok this week"
- "Check performance on all videos posted in the last 7 days"
- "Who are the top 5 competitors in the [niche] space and what's working for them?"

**Content Agent:**
- "Generate 3 TikTok content packages for the industrial welding niche"
- "Create a 7-day content calendar with one video per day"
- "Write 5 hook variations on the 'exclusivity + curiosity gap' format"

**Memory Agent:**
- "What formats have worked best for us in the last 30 days?"
- "Give me my daily briefing"
- "Remember: the exclusivity hook outperforms in industrial niche on TikTok"

**Outreach Agent:**
- "Draft a brand deal pitch to [company] based on our recent viral Reel"
- "Create follow-up sequences for the 3 brands we contacted last week"

**Supervisor Agent:**
- "Should we upgrade from Wan 2.6 to Kling 3.0 for TikTok this month?"
- "What's our best performing niche right now and how should we scale it?"
