# BrandFusion: Stealth AI Advertising Agency Pipeline

Welcome to the **BrandFusion** repository. This project contains the complete architecture, agent prompts, and automation workflows for a fully autonomous "Tier 4" AI Ad Agency pipeline.

## Project Overview
BrandFusion leverages advanced orchestration tools to automate the entire process of generating high-converting, viral-style advertising videos for e-commerce brands (specifically in niches like fitness supplements and industrial goods). The pipeline scrapes social media for trending audio, rewrites scripts using specialized LLM agents, and programmatically renders stunning visual content using cloud-based GPUs.

## Technical Architecture

The system is built on a hybrid local/cloud architecture to maintain security while accessing massive compute power:

1. **The Orchestrator (n8n):**
   * We use self-hosted **n8n** locally to manage all API calls, webhooks, and data flow.
   * n8n triggers the sub-agents and handles the final payload delivery to the video rendering engine.
2. **The Rendering Engine (ComfyUI on Vast.ai):**
   * Video generation is incredibly GPU-intensive. We utilize **Vast.ai** cloud instances running RTX 3090/4090 GPUs.
   * n8n sends API requests containing dynamic JSON payloads (prompts) directly to the ComfyUI instance running models like **Wan 2.6 14B** and **Google Veo 3**.
3. **The Multi-Agent Swarm:**
   * **Brand Strategist Agent:** Analyzes the target client's brand and rewrites viral scripts to seamlessly integrate their product.
   * **Camera Director Agent:** Converts the script into hyper-specific, cinematic visual prompts understood by video-generation models.
   * **Audio Agent:** Generates industrial or cinematic soundscapes (via AudioLDM or FishAudio) to mix with the normally silent generated videos.

## Project Structure

*   `/workflows/`: Contains all n8n export JSONs and ComfyUI workflow files.
    *   `Stealth_AI_Ad_Agency_Pipeline_Tier_4_FIXED.json`: The master n8n orchestration workflow.
    *   `basic_sdxl_test.json` / `api_veo3.json`: ComfyUI rendering pipelines.
*   `/agents/`: Markdown files containing the complex System Prompts for each specialized LLM persona.
*   `/content/`: Documentation on viral niches, trigger hooks, and successful prompt engineering.
*   `/openclaw_research/`: In-depth 2026 research on deploying the **OpenClaw Agent OS** and utilizing the **Model Context Protocol (MCP)** for secure, locally-hosted autonomous trading and outreach.

## Autonomous Agent OS (OpenClaw & MCP)
As the project scales from a rigid n8n pipeline to a truly autonomous system, we are transitioning to an **OpenClaw** architecture. 

Key research and implementation findings located in the `openclaw_research` directory include:
*   **Monolithic vs. Multi-Agent Delegation:** Why providing a single agent with all MCP tools causes "Context Window Overload," and how to implement the SLICE framework.
*   **Security Sandboxing:** Best practices for deploying OpenClaw in Docker/WSL2 to prevent host-machine compromise.
*   **Cost Optimization:** Benchmarking OpenRouter API costs to utilize models like DeepSeek V3.2 ($0.80/1M output tokens) for background logic loops instead of relying exclusively on Claude 3 Opus.

## Setup & Deployment
*(Note: Full deployment requires a Vast.ai account, a local n8n instance, and API keys for OpenRouter or native LLM providers).*

1. Import the master `.json` workflow into your local n8n instance.
2. Spin up a ComfyUI instance on Vast.ai and expose the API port.
3. Update the `ComfyUI Render` HTTP Request node in n8n with your Vast.ai IP address and `?token=` parameter.
4. Execute the n8n webhook to trigger the end-to-end pipeline.
