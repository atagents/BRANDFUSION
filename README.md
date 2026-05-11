# BrandFusion

> **Status:** Archived prototype (2024). Superseded by the [OpenClaw](https://github.com/atagents/pulsesales) multi-agent architecture, which generalises the orchestration patterns explored here.
> Repo kept public as a reference for the agent prompts, n8n topology, and GPU-pipeline design.

---

## What it was

An end-to-end pipeline for generating short-form **AI video ads** from a single brand brief.

A small swarm of role-specialised LLM agents collaborated to produce a creative concept, then handed off to a GPU-backed image/video generation stage:

- **Brand Strategist agent** — interprets the brief, defines tone, audience, and creative angle
- **Camera Director agent** — translates the concept into shot lists and visual prompts
- **Audio agent** — drafts voice-over copy, pacing, and music direction
- **Render stage** — n8n orchestrates ComfyUI workflows running on **Vast.ai** GPU instances

The output: a structured creative package + generated video assets, with no human in the loop between brief and first draft.

---

## Architecture

```
Brief
  │
  ▼
[ n8n orchestrator ]
  ├── Brand Strategist  (LLM)
  ├── Camera Director   (LLM)
  └── Audio agent       (LLM)
        │
        ▼
[ ComfyUI on Vast.ai GPU ]
        │
        ▼
   Video assets + creative package
```

**Stack:** n8n · ComfyUI · Vast.ai (on-demand GPU) · OpenAI / Anthropic for the agent layer.

---

## Why it's archived

BrandFusion was a vertical experiment — a single, narrow workflow. The orchestration, agent-handoff, and tool-routing patterns it proved out have since been re-implemented as a general-purpose framework in **OpenClaw**, which is now my active multi-agent platform.

Rather than maintain two codebases solving overlapping problems, BrandFusion is frozen here as a reference implementation.

---

## What's still useful in this repo

- **Agent system prompts** — production-tested role definitions for creative-pipeline agents
- **n8n workflow JSON** — multi-agent orchestration topology with conditional handoffs
- **ComfyUI workflows** — image/video generation graphs tuned for ad creative
- **Vast.ai integration notes** — on-demand GPU spin-up patterns

---

## Author

**Alex T** — AI Solutions Specialist, London
[LinkedIn](https://linkedin.com/in/t-alex-t) · [GitHub](https://github.com/atagents) · t.alex_t@yahoo.com
