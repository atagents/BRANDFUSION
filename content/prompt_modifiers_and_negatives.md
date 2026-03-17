# 🎛️ Advanced Prompt Modifiers & Negative Prompts
## The Viral Shorts AI Video Dictionary (2026)

*Use this dictionary to enhance any base prompt in the BrandFusion pipeline. These modifiers are tested to generate higher watch-time and algorithm-rewarding visual fidelity.*

---

## 🚫 PART 1: NEGATIVE PROMPTS (By Model)

Negative prompts tell the AI what NOT to generate. In video, negative prompts are crucial for preventing "temporal flickering" and preventing the video from looking like an AI hallucination.

### 1. The Universal "Anti-Slop" Negative (Use for ALL Models)
> `static frame, slow pacing, blurry details, out of focus, overexposed, oversaturated colors, subtitles, text overlays, visible watermark, painting style, illustration, worst quality, low quality, JPEG artifacts, deformed face, extra fingers, fused limbs, morphing objects, temporal inconsistency, flickering light, duplicate subjects`

### 2. Wan 2.6 / HunyuanVideo Specific (ComfyUI Opensource)
*Open-source models tend to struggle with "melting" backgrounds and extra limbs.*
> `melting background, background distortion, extra legs, extra arms, fused hands, unnatural physics, floating objects, poorly drawn hands, poorly drawn face, disfigured, malformed limbs, cartoon, anime, 3d render, low resolution, pixelated, noisy, text, watermark, signature`

### 3. Kling 3.0 Specific
*Kling sometimes over-smooths skin or makes lighting look "plastic".*
> `plastic skin, airbrushed, CGI look, smooth texture, artificial lighting, unnatural skin tone, over-saturated, flat lighting, 2D appearance, low contrast, washed out colors, rigid movement, robotic animation, stuttering`

### 4. Google Veo 3.1 / Sora 2 Specific
*These models are very good, so negatives focus on preventing cinematic clichés and maintaining realism.*
> `stock footage look, overly dramatic lighting, artificial color grading, unnatural physics, broken geometry, floating camera, unnatural camera shake, text generation, generic corporate aesthetic, smooth digital look`

---

## ➕ PART 2: THE POSITIVE "VIRAL ENHANCER" DICTIONARY

Appending these exact phrases to the end of your prompts drastically improves the chance of the video stopping a scrolling thumb.

### 🎥 1. Camera Movement (Crucial for 9:16 Shorts)
*TikTok and Shorts algorithms heavily penalize completely static videos in the first 3 seconds. Always specify camera motion.*

- **The FPV Drone:** `fast FPV drone flight through, weaving between obstacles, aggressive banking, high speed motion blur` *(Best for: Sports, Real Estate, Action)*
- **The Slow Reveal:** `slow dolly-in from wide establishing shot to extreme close-up, rack focus` *(Best for: Luxury, Food, ASMR)*
- **The Orbit:** `smooth 360-degree camera orbit around the subject, subject remains locked in center frame` *(Best for: Fashion, Character intros)*
- **The Tracking Run:** `low-angle tracking shot following just slightly behind and below the subject, handheld camera shake` *(Best for: Gritty realism, Industrial, Fitness)*
- **The Drop:** `camera plunging vertically downward, rapid descent, visceral speed` *(Best for: Epic landscapes, Sci-fi)*

### 💡 2. Lighting & Atmosphere (The "Premium" Factor)
*Lighting separates "AI slop" from premium cinematic content.*

- **The Golden Hour:** `golden hour backlighting, long warm shadows, sun flaring directly into the lens, dust motes dancing in the light`
- **The Cyberpunk/Neon:** `harsh neon rim lighting, cyan and magenta color contrast, wet asphalt reflecting bright signs, heavy atmospheric rain`
- **The Industrial Mood:** `harsh overhead sodium floodlights, deep harsh shadows, sparks providing natural practical light, gritty high-contrast`
- **The Premium Studio:** `soft diffused box lighting, perfect rim light separating subject from background, infinite seamless backdrop, Vogue editorial style`
- **The Moody Cinematic:** `chiaroscuro lighting, deep crushed blacks, single strong directional light source cutting through volumetric fog`

### 📺 3. Aesthetic & Format Modifiers
*Use these to trigger specific visual training data in the AI models.*

- **IMAX Documentary:** `shot on IMAX 70mm, National Geographic aesthetic, raw hyper-realism, extreme high fidelity, pristine wildlife photography`
- **UGC / iPhone (For Ads):** `shot on iPhone 16 Pro Max, vertical handheld footage, natural auto-exposure adjustments, authentic candid aesthetic, slight natural handshake`
- **Macro ASMR:** `extreme macro photography, microscopic detail, 100mm macro lens, ultra-shallow depth of field, tactile textures`
- **Dashcam / Security (For Virality):** `dashcam footage, security camera aesthetic, timestamps in corner, gritty low-light artifacts, authentic found-footage style`
- **Vintage / Nostalgia:** `shot on Kodak Portra 400 film, 16mm film grain, halation around highlights, slight vignette, nostalgic warm color grade`

---

## 🏗️ PART 3: COMBINING THE MODIFIERS (Formula Examples)

### Formula: `[Subject] + [Action] + [Camera Modifier] + [Lighting Modifier] + [Aesthetic Modifier]`

**Example A: UGC Viral Ad (High Conversion)**
> A normal guy sitting in his car talking enthusiastically to the camera, **[Camera]** `shot on iPhone 16 Pro Max, vertical handheld footage, slight natural handshake`, **[Lighting]** `cloudy overcast day providing soft natural light through the windshield`, **[Aesthetic]** `authentic candid style, UGC advertising aesthetic.`

**Example B: Premium Instagram Reel (High Aesthetic)**
> A luxury espresso machine extracting perfect crema into a crystal glass, **[Camera]** `extreme macro photography, slow dolly-in, rack focus from the glass to the falling liquid`, **[Lighting]** `moody chiaroscuro lighting, deep crushed blacks, single strong directional spotlight`, **[Aesthetic]** `commercial food photography, 4K, ultra-shallow depth of field.`

**Example C: TikTok "Beautiful Absurdity" (High Virality)**
> A giant robotic octopus working as a mechanic on a racecar, **[Camera]** `low-angle tracking shot moving rapidly around the garage`, **[Lighting]** `harsh neon rim lighting, cyan and magenta contrast, sparks providing practical light`, **[Aesthetic]** `hyper-realistic CGI, Hollywood blockbuster VFX quality, 8K.`
