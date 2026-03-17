# 🏗️ The Hybrid Local-Cloud Engine Architecture

## The Cost-Saving Strategy
Running high-end API endpoints or renting 24/7 cloud GPUs (like H100s or RTX 4090s on Vast.ai) is incredibly expensive if they are sitting idle while agents research, write scripts, or wait for human approval.

**The Solution:** The BrandFusion agency runs on a **Hybrid Architecture**.

1.  **The Local Control Center (Your PC):** Runs text agents, API calls, scheduling, memory, and n8n workflows for free.
2.  **The Cloud Render Node (Vast.ai / RunPod):** Spins up *only* when a batch of videos is fully scripted, approved, and ready to be rendered.

---

## 💻 1. The Local PC (The Brain)
Your local computer (even with a CPU or an AMD GPU) handles all the logic, orchestration, and lightweight generation.

**What runs locally:**
*   **OpenClaw Agents:** The Supervisor, Research, Content, and Memory agents run locally. They use text-based API calls (OpenRouter/OpenAI) which require almost zero local computing power.
*   **n8n Automation:** The central nervous system. It triggers the agents, monitors TikTok trends, and schedules the final video uploads.
*   **ComfyUI (Headless/Control Mode):** You run ComfyUI locally to *build* and *test* the visual logic of the JSON workflows (like the vertical Wan 2.6 workflow).
*   **Audio Generation:** API calls to ElevenLabs/FishAudio are triggered from the local PC.

---

## ☁️ 2. The Cloud Node (The Muscle)
You rent a massive GPU (Nvidia RTX 4090 or A6000) on Vast.ai for ~$0.40 to $0.80 an hour. 

**What runs in the cloud:**
*   **ComfyUI Backend (API Mode):** The cloud instance runs ComfyUI with the `--listen` flag enabled. It sits waiting for a payload.
*   **Massive Models:** Wan 2.6 (5B), Sora (via API), Kling, Flux, or ShotVerse. 

---

## 🔄 The Handoff Workflow (How it connects)

Here is the exact step-by-step of how your local PC triggers the cloud render:

1.  **Generation:** Local Content Agent finishes a batch of 5 TikTok scripts.
2.  **Assembly:** Local n8n automatically injects those scripts into your ComfyUI JSON format (the `comfyui_tiktok_vertical_wan22_5B.json` file we built).
3.  **The Ping:** Local n8n makes an HTTP POST request to your Vast.ai ComfyUI IP address (e.g., `http://192.168.x.x:8188/prompt`).
4.  **Payload:** The POST request contains the JSON workflow file. 
5.  **Rendering:** The Cloud GPU receives the JSON and starts blasting through the 5 video renders. (Takes maybe 20 minutes).
6.  **Retrieval:** Once finished, the Cloud GPU saves the `.mp4` files. Local n8n polls the cloud server, downloads the finished videos back to your PC, and then you can **shut down the cloud instance to stop paying for it.**

## The Golden Rule of Hybrid Production
**Never turn the cloud GPU on until the Local PC has 10+ prompt JSONs queued up and ready to render.** Batch process everything to maximize your $0.50/hour server rental.
