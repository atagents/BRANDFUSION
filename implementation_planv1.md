# Stealth AI Advertising Agency - Implementation Plan

## Overview
This plan outlines the architecture for a fully automated, multi-agent AI video generation pipeline. The goal is to recreate viral content and seamlessly inject brand placements using BrandFusion, monetizing via sponsorships.

## Directory Structure
The project is divided into the following directories:
- `/agents`: System prompts and configuration files for specialized AI agents.
- `/content_strategy`: Research, viral hooks, and script templates.
- `/workflows`: n8n and ComfyUI JSON workflows for automation.
- `/video_assets`: Generated assets (audio, generated clips, final renders).
- `/client_outreach`: CRM data, lead generation, and pitch scripts.

## Monetization & Automation Tiers

### Tier 1: Manual Operator (Fastest setup, lowest cost)
- **Process**: You manually find viral TikToks, use ChatGPT to rewrite scripts, generate audio in FishAudio, generate video in Higgsfield, and run BrandFusion locally.
- **Goal**: Create a portfolio of 3-5 high-quality examples to show potential clients. *Start here to get a feel for the tools.*

### Tier 2: Semi-Automated Content Engine
- **Process**: Use **n8n** (an automation tool) to automatically scrape top trending TikToks/Shorts in specific niches via API. N8n sends transcripts to an LLM to automatically generate rewritten scripts and FishAudio prompts.
- **Goal**: Reduce prep time. You only step in to assemble the video in ComfyUI or a video editor.

### Tier 3: Agentic Workflow (Multi-Agent Setup)
- **Process**: We deploy specialized AI Agents (e.g., using CrewAI, LangChain, or n8n Advanced AI nodes). 
  - **Agent 1 (Trend Analyst)**: Finds the viral video.
  - **Agent 2 (Creative Director)**: Plans the shot list and camera trajectories for ShotVerse.
  - **Agent 3 (Brand Strategist)**: Determines the exact frame and setting to run BrandFusion.
- **Goal**: Full creative strategy is outsourced to agents. You just approve the plan.

### Tier 4: The "Print Money" Automated Machine
- **Process**: n8n triggers the Agents -> Agents trigger ComfyUI APIs (running ShotVerse & WildActor) -> ComfyUI outputs video -> n8n triggers BrandFusion API -> Final video drops in a Google Drive folder.
- **Goal**: Zero human touch video creation.

### Tier 5: Automated Monetization
- **Process**: An Outreach Agent finds e-commerce brands on Shopify, looks at their product, automatically generates a stealth-ad video using Tier 4, and emails the brand: *"Hey, we made this viral video template with your product in it. Want to buy the rights for $500?"*

## Agentic Workflows Explained
Agentic workflows are the current meta in AI because instead of asking one AI to do everything (which causes it to lose context or make mistakes), you have multiple "micro-AIs" that talk to each other. 
Using an automation server like **n8n** (which you already have access to on your machine), you can visually link these agents together.

### Base Agent Prompt
When building the agents, we will use this master context prompt to ensure they understand their role in the pipeline:
> "You are the [INSERT ROLE] for a Stealth AI Advertising Agency. Our pipeline converts viral organic content into monetizable stealth ads. We use FishAudio for voice, ShotVerse/Higgsfield for camera generation, WildActor for character consistency, and BrandFusion for stealth product placement."
