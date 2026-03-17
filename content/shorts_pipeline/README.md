# 📱 Viral Shorts: Complete Production System
## TikTok · YouTube Shorts · Instagram Reels
### BrandFusion Operational Playbook — 2026

*Read this document first. It ties together the entire short-form video operation.*

---

## 🗂️ Folder Structure (This System)

```
content/
├── shorts_pipeline/
│   ├── README.md                     ← (This file) Master overview
│   ├── tiktok_pipeline.md            ← TikTok-specific production pipeline
│   ├── youtube_shorts_pipeline.md    ← YouTube Shorts-specific pipeline
│   ├── instagram_reels_pipeline.md   ← Instagram Reels-specific pipeline
│   ├── hook_library.md               ← 100+ tested opening hooks by niche
│   └── openclaw_agent_integration.md ← How OpenClaw agents power this system
│
├── viral_niches_and_prompts.md       ← ✅ Existing — Advanced prompt library
│
tech_intelligence_2026/
└── viral_video_generation.md         ← ✅ Existing — Model comparison & strategy
```

---

## 🔄 The Full System at a Glance

```
       ┌─────────────────────────────────────────────┐
       │         DAILY VIRAL MACHINE                  │
       │   (Runs automatically via n8n + OpenClaw)    │
       └───────────────────┬─────────────────────────┘
                           │
          ┌────────────────▼─────────────────┐
          │  STEP 1: TREND DISCOVERY         │
          │  Research Agent (OpenClaw)        │
          │  + n8n TikTok/Trends scraper     │
          └────────────────┬─────────────────┘
                           │
          ┌────────────────▼─────────────────┐
          │  STEP 2: SCRIPT + PROMPT GEN     │
          │  Content Agent (OpenClaw)         │
          │  → Hook + Video Prompt + Caption  │
          └────────────────┬─────────────────┘
                           │
          ┌────────────────▼─────────────────┐
          │  STEP 3: VIDEO RENDER            │
          │  ComfyUI (Vast.ai GPU)           │
          │  Wan 2.6 / HunyuanVideo / Kling   │
          └────────────────┬─────────────────┘
                           │
          ┌────────────────▼─────────────────┐
          │  STEP 4: AUDIO + ASSEMBLY        │
          │  AudioLDM → VHS VideoCombine     │
          │  CapCut auto-captions (optional) │
          └────────────────┬─────────────────┘
                           │
          ┌────────────────▼─────────────────┐
          │  STEP 5: HUMAN REVIEW (30 sec)   │
          │  Approve/Reject in queue         │
          └────────────────┬─────────────────┘
                           │
          ┌────────────────▼─────────────────┐
          │  STEP 6: AUTO-PUBLISH            │
          │  n8n → TikTok / YT / Instagram   │
          │  Posted at peak algorithm times  │
          └────────────────┬─────────────────┘
                           │
          ┌────────────────▼─────────────────┐
          │  STEP 7: PERFORMANCE MONITOR     │
          │  Research Agent polls 24h data   │
          │  Memory Agent stores winners     │
          └──────────────────────────────────┘
```

---

## 🤖 OpenClaw Agents — Role in Shorts Production

| Stage | Agent | What It Does |
|---|---|---|
| Trend Discovery | **Research Agent** | Scrapes TikTok Creator Insights, Reddit, Google Trends every 6h |
| Script Writing | **Content Agent** | Writes hook + video prompt + caption using 8-Element formula |
| Platform Selection | **Content Agent** | Chooses best platform (TikTok/YT/Reels) based on content type |
| Performance Data | **Research Agent** | Pulls 24hr view/share data from platform APIs |
| Winner Storage | **Memory Agent** | Logs top-performing hooks and formats for future reuse |
| Client Outreach | **Outreach Agent** | Spots brands going viral → auto-drafts partnership pitch |
| Budget Decisions | **Supervisor Agent** | Decides when to upgrade from Tier A (free) to Tier B/C (paid API) |

---

## 💰 Production Cost Tiers (Quick Reference)

| Tier | Daily Volume | Cost/Video | Tool Stack | Best For |
|---|---|---|---|---|
| **A — Rapid Fire** | 5-20 videos/day | ~$0.02 | n8n + Wan 2.6 + Vast.ai | TikTok volume play |
| **B — Premium Social** | 1-5 videos/day | ~$1-2 | Kling 3.0 + CapCut | Client brand content |
| **C — Broadcast** | 1-2 videos/week | ~$10-20 | Veo 3.1 + DaVinci | Paid client deliverables |

---

## ⚡ Peak Posting Times by Platform (UTC+8 / Philippines/Singapore)

| Platform | Best Days | Best Times |
|---|---|---|
| **TikTok** | Tue, Thu, Fri | 7-9AM · 12-2PM · 7-9PM |
| **YouTube Shorts** | Mon, Wed, Sat | 8-10AM · 2-4PM · 8-10PM |
| **Instagram Reels** | Mon-Fri | 9-11AM · 12-2PM · 5-7PM |

---

## 📐 Technical Specs Cheatsheet

| Platform | Ratio | Max Length | Min Resolution | Max File Size |
|---|---|---|---|---|
| TikTok | 9:16 | 10 min (optimal: 15-30s) | 720p (1080p preferred) | 4GB |
| YouTube Shorts | 9:16 | 60 seconds | 1080p required | 256GB |
| Instagram Reels | 9:16 | 90 seconds (optimal: 15-30s) | 1080p required | 4GB |

---

## 🔗 Related Documents

- **Prompt Library:** `content/viral_niches_and_prompts.md`
- **Model Comparison:** `tech_intelligence_2026/viral_video_generation.md`
- **TikTok Pipeline:** `content/shorts_pipeline/tiktok_pipeline.md`
- **YouTube Pipeline:** `content/shorts_pipeline/youtube_shorts_pipeline.md`
- **Reels Pipeline:** `content/shorts_pipeline/instagram_reels_pipeline.md`
- **Agent Definitions:** `openclaw_agents/content_agent.md`
