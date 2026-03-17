# Contributing to BrandFusion

Welcome to the BrandFusion Elite Stealth AI Advertising Agency Pipeline! 

This repository contains the overarching architecture, prompts, n8n orchestration nodes, and OpenClaw OS research needed to run a fully autonomous video generation firm.

To ensure all team members can build, test, and render videos without overriding each other's compute instances or API limits, please adhere to the following setup stricture.

---

## 🚀 1. Initial Setup (Local Machine)

1. **Clone the Repository:**
   Open your terminal and clone the master branch to your local workspace:
   ```bash
   git clone https://github.com/bugfix103/BRANDFUSION.git
   cd BRANDFUSION
   ```
2. **Setup the Orchestrator (n8n):**
   * Download and install **n8n** locally.
   * Open n8n and select **Import Workflow from File**.
   * Target the `workflows/Stealth_AI_Ad_Agency_Pipeline_Tier_4_FIXED.json` file.

---

## 🖥️ 2. Cloud Compute Setup (Vast.ai)
Because we are generating high-fidelity video (Wan2.2, Google Veo), you **cannot** run this entirely locally unless you own multiple RTX 4090s or an unconstrained Mac Studio.

*You must rent your own compute node so you do not burn another contributor's GPU credits.*

1. Create a [Vast.ai](https://vast.ai/) account and add credits.
2. Spin up an **RTX 3090 or 4090 instance** using the default ComfyUI template.
3. Open the Jupyter Notebook / SSH terminal on your Vast.ai instance and locate your **API Proxy Token** (usually in the start script or environment variables via the `token=` parameter).

---

## 🔗 3. Wiring Your Pipeline

1. **Upload Workflows to Cloud:**
   * Open your Vast.ai ComfyUI interface.
   * Drag and drop `api_veo3.json` or `basic_sdxl_test.json` (found in the `workflows/` folder) to load the nodes. Install any missing custom nodes via the ComfyUI Manager and restart.
2. **Connect n8n to Vast.ai:**
   * Open your local n8n workflow.
   * Locate the **ComfyUI Render (HTTP Request Node)**.
   * Change the `URL` strictly to your *own* Vast.ai IP address and append your token:
     `http://YOUR_VAST_IP:YOUR_PORT/prompt?token=YOUR_TOKEN`
   * Leave Authentication set to "None" (the token handles auth).

---

## 🔒 4. Security & API Keys (CRITICAL)

**DO NOT COMMIT API KEYS TO THIS REPOSITORY.**

*   **OpenRouter / Model Pricing:** We primarily utilize OpenRouter for access to Claude 3.5 Sonnet, DeepSeek V3.2, and Qwen3 Coder (Review `openclaw_research/models_and_pricing.md` for tier lists).
*   **Locality:** All your API keys (OpenRouter API, Vast.ai, specific LLM keys) must be injected directly into **your local n8n instance** or stored in a `.env` file that is strictly git-ignored.
*   **Safety Check:** If you accidentally commit a key, immediately revoke it via the provider's dashboard.

---

## 🌿 5. Git Workflow & Collaboration

We follow a standard feature-branch workflow to ensure the master pipeline remains stable.

1. **Never build directly on `master`.**
2. Before making changes to a prompt or a workflow, create a new branch:
   ```bash
   git checkout -b feature/update-audio-agent
   ```
3. Make your changes (e.g., editing `agents/brand_strategist_agent.md`).
4. Commit your changes with descriptive messages:
   ```bash
   git add .
   git commit -m "Enhance audio generation prompt for loud machinery"
   ```
5. Push your branch and open a **Pull Request (PR)** on GitHub.
   ```bash
   git push origin feature/update-audio-agent
   ```
6. The lead architect will review the PR (and potentially test the new n8n `.json` export) before merging it into `master`.

---

## 📚 6. Reading Material

Before modifying the core logic, please review:
*   `/openclaw_research/mcp_tool_delegation.md` - Understand why we isolate tools (e.g., the communications agent cannot access the crypto wallet).
*   `/openclaw_research/security_architectures.md` - Why OpenClaw must run in a Docker/WSL2 sandbox.

Happy building!
