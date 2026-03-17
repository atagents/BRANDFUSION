# ☁️ How to Set Up ComfyUI on RunPod (The Cheapest Way)

Since your local AMD GPU won't cooperate with the advanced video models, we will rent a massive NVIDIA GPU in the cloud for pennies per minute. We will use **RunPod**, which is incredibly cheap and easy to connect to our n8n brain.

## Step 1: Create an Account & Add Funds
1. Go to [RunPod.io](https://www.runpod.io/) and create an account.
2. Click on **Billing** and add a minimum balance (usually $25 is enough to get started).

## Step 2: Deploy the ComfyUI Template
1. Go to the **Pods** tab on the left menu.
2. Click **Deploy** at the top right.
3. **Select Template:** Look for a template called exactly `RunPod ComfyUI` (usually the official or most popular one). 
   * *Do NOT select a "Serverless" template yet, stick to the standard Pod.*
4. **Select GPU:** Click on the **Community Cloud** tab at the top (this is much cheaper than Secure Cloud).
   * Find an **RTX 3090** or **RTX 4090**. 
   * *Tip: The 3090 has 24GB of VRAM and costs around $0.34/hr. This is the sweet spot for budget video generation.*
5. **Configure Storage:**
   * Container Disk: **20 GB** (Temporary space)
   * Volume Disk: **100 GB** (This is where your models are saved permanently. **Critical: Do not skip this, or you lose your models every time you turn it off.**)
6. Click **Deploy**.

## Step 3: Connect to ComfyUI
1. Go to your **Pods** dashboard. It will say `Deploying` and then `Running`.
2. Click the **Connect** button on your running pod.
3. Click the button that says **Connect to HTTP Service [Port 8188]**.
4. A new tab will open showing the familiar ComfyUI interface.

## Step 4: Cost Management (VERY IMPORTANT)
When you are done testing for the day, **DO NOT leave the pod running.**
1. Go to your Pods dashboard.
2. Click the **Stop** button. This halts the $0.34/hr GPU charge.
3. **You will still be charged ~$0.10/GB/month for the 100GB Volume disk** so your models are waiting for you tomorrow (about $10 a month).
4. When you are totally done with the project, you must click **Terminate** to delete everything and stop all billing.

## Step 5: Connecting to n8n
When your pod is running and you have the URL from Step 3 (it will look something like `https://xxx-8188.proxy.runpod.net`), keep that URL open. The next step is for me to update our n8n workflow to point to that new URL instead of `localhost`!

---
**Task:** Follow Steps 1, 2, and 3 above. Let me know when you have the RunPod ComfyUI screen open in your browser!
