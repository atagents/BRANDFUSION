const fs = require('fs');

try {
    const inputPath = 'C:/Users/DON PERIGNON/Downloads/Stealth AI Ad Agency Pipeline (Tier 4).json';
    const outputPath = 'E:/SHVMSTORAGE/BRANDFUSION/workflows/Stealth_AI_Ad_Agency_Pipeline_Tier_4_FIXED.json';
    
    let workflow = JSON.parse(fs.readFileSync(inputPath, 'utf8'));

    let renderNode = workflow.nodes.find(n => n.name === 'ComfyUI Render');
    if (renderNode) {
        renderNode.parameters.url = 'http://1.34.114.64:62205/prompt?token=092475c6eb5141de21d222d375448c29cdd73c24db753dc2250c5664c3fcbb67';
        renderNode.parameters.authentication = 'none';
        renderNode.parameters.sendBody = true;
        renderNode.parameters.specifyBody = 'json';
        
        let jsonPayload = `={
  "prompt": {
    "3": {
      "inputs": {
        "model": ["48", 0],
        "positive": ["6", 0],
        "negative": ["7", 0],
        "latent_image": ["55", 0],
        "seed": 285741127119524,
        "steps": 36,
        "cfg": 4,
        "sampler_name": "uni_pc",
        "scheduler": "simple",
        "denoise": 1
      },
      "class_type": "KSampler",
      "_meta": {"title": "KSampler"}
    },
    "6": {
      "inputs": {"clip": ["38", 0], "text": {{ JSON.stringify("premium product commercial, clean composition, realistic textures, natural skin tones, balanced exposure, soft contrast, controlled highlights, cinematic but realistic color grading, smooth camera motion, polished advertising aesthetic, " + ($json.text || "")) }} },
      "class_type": "CLIPTextEncode",
      "_meta": {"title": "CLIP Text Encode (Positive Prompt)"}
    },
    "7": {
      "inputs": {"clip": ["38", 0], "text": "oversaturated colors, harsh contrast, clipped highlights, crushed blacks, overexposure, static, blurry details, subtitles, artwork, painting, still image, gray tone, neon color cast, worst quality, low quality, JPEG artifacts, ugly, broken, extra fingers, poorly drawn hands, poorly drawn face, deformed, disfigured, malformed limbs, fused fingers, motionless frame, cluttered background, three legs"},
      "class_type": "CLIPTextEncode",
      "_meta": {"title": "CLIP Text Encode (Negative Prompt)"}
    },
    "8": {
      "inputs": {"samples": ["3", 0], "vae": ["39", 0]},
      "class_type": "VAEDecode",
      "_meta": {"title": "VAEDecode"}
    },
    "37": {
      "inputs": {"unet_name": "Wan2.2/wan2.2_ti2v_5B_fp16.safetensors", "weight_dtype": "default"},
      "class_type": "UNETLoader",
      "_meta": {"title": "UNETLoader"}
    },
    "38": {
      "inputs": {"clip_name": "umt5_xxl_fp8_e4m3fn_scaled.safetensors", "type": "wan"},
      "class_type": "CLIPLoader",
      "_meta": {"title": "CLIPLoader"}
    },
    "39": {
      "inputs": {"vae_name": "wan2.2_vae.safetensors"},
      "class_type": "VAELoader",
      "_meta": {"title": "VAELoader"}
    },
    "47": {
      "inputs": {"images": ["8", 0], "filename_prefix": "ComfyUI_video", "codec": "vp9", "fps": 24, "crf": 12.0},
      "class_type": "SaveWEBM",
      "_meta": {"title": "SaveWEBM"}
    },
    "48": {
      "inputs": {"model": ["37", 0], "shift": 8.0},
      "class_type": "ModelSamplingSD3",
      "_meta": {"title": "ModelSamplingSD3"}
    },
    "55": {
      "inputs": {"vae": ["39", 0], "width": 832, "height": 480, "length": 121, "batch_size": 1},
      "class_type": "Wan22ImageToVideoLatent",
      "_meta": {"title": "Wan22ImageToVideoLatent"}
    }
  }
}`;
        renderNode.parameters.jsonBody = jsonPayload;
        
        if (renderNode.parameters.bodyParameters) {
            delete renderNode.parameters.bodyParameters;
        }
    }

    fs.writeFileSync(outputPath, JSON.stringify(workflow, null, 2));
    console.log('Successfully wrote ' + outputPath);
} catch(e) {
    console.error('Error generating JSON:', e);
}
