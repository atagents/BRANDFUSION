# ComfyUI Installation Guide (AMD RX 6700 XT)

Because you are running an AMD GPU on Windows, you cannot follow standard NVIDIA tutorials or you will get extreme slowdowns. You must install the version of ComfyUI that natively supports **ROCm** (AMD's version of CUDA) on Windows.

## Step 1: Download ComfyUI Desktop
The easiest and most reliable way to get AMD ROCm working on Windows is to use the official [ComfyUI Desktop App](https://github.com/Comfy-Org/desktop/releases).
1. Go to the [ComfyUI Desktop GitHub Releases page](https://github.com/Comfy-Org/desktop/releases).
2. Download the latest installer for Windows (look for the `.exe` file).
3. Run the installer. 
4. **Important:** The Desktop app is designed to automatically detect your AMD hardware and download the correct ROCm dependencies. Let the installer run completely; it may take a while as it downloads PyTorch and AMD drivers.

## Step 2: Verify GPU Acceleration
Once ComfyUI is installed and open:
1. Load a simple default generation workflow.
2. Hit "Queue Prompt" to generate an image.
3. Open your Windows Task Manager (Ctrl+Shift+Esc), go to the **Performance** tab, and click on your **AMD Radeon RX 6700 XT**.
4. Watch the "Dedicated GPU memory" and the 3D graph. If you see spikes in usage and your VRAM filling up, ROCm is working correctly and utilizing your 12GB of VRAM! 
   * If the generation takes several minutes for a single image, it means it fell back to using your CPU or DirectML, and we need to troubleshoot your ROCm drivers.

## Step 3: Install Custom Nodes (For Video)
Once you confirm the base image generation works fast:
1. In the ComfyUI interface, you need to open the **Manager**. (If the Desktop app doesn't have it by default, you install the [ComfyUI-Manager](https://github.com/ltdrdata/ComfyUI-Manager) by cloning its repo into the `custom_nodes` folder).
2. Inside the Manager, click **Install Missing Custom Nodes**.
3. You will need to search for and install the nodes required for the advanced video workflows:
   * **AnimateDiff** (or the specific video diffusion model you plan to use if ShotVerse isn't natively supported yet).
   * **IP-Adapter** and **ControlNet** (crucial for keeping character faces consistent like WildActor does).
   * Any missing nodes from the `comfyui_brandfusion_api.json` placeholder I made for you.

## Note on Video Constraints (12GB VRAM)
Video generation is incredibly heavy. A 12-second clip at 1080p might cause an "Out of Memory" (OOM) error on a 12GB card.
**The Solution:** Generate the video at a very low resolution (e.g., 512x512 or 768x432) for the base animation. Once the animation is generated, pass it through a generic Topaz Video AI or a fast latent upscaler node to increase the resolution *after* the heavy video diffusion is complete.
