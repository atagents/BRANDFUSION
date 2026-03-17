# 🧠 OpenClaw Multi-Agent System Architecture
## BrandFusion Autonomous Agent Stack — 2026

---

## Overview

This folder defines the complete role architecture for the BrandFusion **OpenClaw Agent OS** deployment. The system follows the **SLICE Framework** (Specialized, Limited, Isolated, Composable, Escalating) to ensure security, cost efficiency, and scalability.

Each agent is a **separate, sandboxed process** with:
- A unique **System Prompt** (defined in its own `.md` file)
- A **specific, minimal set of MCP tools** (no agent has ALL tools)
- A defined **escalation path** (when to call the Supervisor)
- A **memory scope** (what it can remember vs. what it forgets)

---

## 🏗️ Agent Hierarchy

```
┌─────────────────────────────────────────────┐
│           SUPERVISOR AGENT                   │
│    (Orchestrator — Claude 3.5 Sonnet)        │
│    Routes tasks to specialist sub-agents     │
└──────────────┬──────────────────────────────┘
               │
    ┌──────────┼──────────────────────────────┐
    │          │          │          │         │
    ▼          ▼          ▼          ▼         ▼
 RESEARCH   CONTENT   CRYPTO    OUTREACH   MEMORY
  AGENT      AGENT    TRADING    AGENT      AGENT
             AGENT
(DeepSeek  (DeepSeek  (Qwen3   (Qwen3    (Llama 3.3)
   V4)        V4)    Coder)    Coder)
```

---

## 🔐 MCP Tool Assignment Matrix

| Tool Category | Supervisor | Research | Content | Crypto | Outreach | Memory |
|---|:---:|:---:|:---:|:---:|:---:|:---:|
| **Web Search** | ✅ | ✅ | ⛔ | ✅ | ✅ | ⛔ |
| **File System (Read)** | ✅ | ✅ | ✅ | ⛔ | ⛔ | ✅ |
| **File System (Write)** | ✅ | ✅ | ✅ | ⛔ | ⛔ | ✅ |
| **Code Execution** | ✅ | ✅ | ⛔ | ✅ | ⛔ | ⛔ |
| **Browser Control** | ⛔ | ✅ | ⛔ | ✅ | ✅ | ⛔ |
| **Email / Gmail** | ⛔ | ⛔ | ⛔ | ⛔ | ✅ | ⛔ |
| **Social Media APIs** | ⛔ | ⛔ | ✅ | ⛔ | ✅ | ⛔ |
| **Crypto/Trading APIs** | ⛔ | ⛔ | ⛔ | ✅ | ⛔ | ⛔ |
| **Calendar/Notion** | ✅ | ⛔ | ⛔ | ⛔ | ⛔ | ✅ |
| **ComfyUI/n8n API** | ✅ | ⛔ | ✅ | ⛔ | ⛔ | ⛔ |
| **Vector DB (Memory)** | ⛔ | ⛔ | ⛔ | ⛔ | ⛔ | ✅ |

> ⚠️ **Security Rule:** No single agent has access to BOTH the crypto wallet tools AND the email/outreach tools simultaneously. This prevents a compromised agent from both trading and exfiltrating credentials.

---

## 🤖 Model Selection by Agent

| Agent | Recommended Model | Why | Approx Cost |
|---|---|---|---|
| **Supervisor** | Claude 3.5 Sonnet (OpenRouter) | Best orchestration, instruction following | ~$3/1M tokens |
| **Research** | DeepSeek V4 (OpenRouter) | Excellent web comprehension + long context | ~$0.80/1M |
| **Content** | DeepSeek V4 (OpenRouter) | Strong creative writing + code generation | ~$0.80/1M |
| **Crypto Trading** | Qwen3 Coder (OpenRouter) | Fast reasoning, code execution, free tier | Free / $0.10/1M |
| **Outreach** | Qwen3 Coder (OpenRouter) | Good instruction following for templates | Free / $0.10/1M |
| **Memory** | Llama 3.3 70B (OpenRouter) | Efficient for structured memory ops | ~$0.10/1M |

---

## 🔒 Security Sandbox Configuration

All OpenClaw agents MUST run in one of the following isolated environments:

### Option A: Docker Containers (Recommended)
```bash
# Each agent runs in its own container with limited network access
docker run --rm \
  --network=agent-internal \
  --memory=4g \
  --cpus=2 \
  --read-only \
  --tmpfs /tmp \
  brandfusion/openclaw-agent:latest
```

### Option B: WSL2 + Firejail Sandboxing
```bash
firejail --noprofile \
  --net=none \        # Disable network (agent uses MCP proxy)
  --noroot \
  --private \
  python agent.py
```

### Option C: VM (Maximum Security — Crypto Agent Only)
- Crypto Trading Agent should run in a dedicated VirtualBox VM
- Snapshot the VM before every trading session
- Rollback immediately if unusual behavior detected

---

## 📡 Inter-Agent Communication Protocol

Agents communicate through a **shared message queue** (Redis or a simple JSON file):

```json
{
  "from": "supervisor",
  "to": "research_agent",
  "task_id": "task_20260318_001",
  "priority": "high",
  "instruction": "Search for current ETH/BTC price correlation data over last 7 days",
  "context": { "purpose": "crypto_trade_signal" },
  "require_approval_before_action": false,
  "timeout_seconds": 120
}
```

> ⚠️ **Human-in-the-Loop Rule:** Any task with `require_approval_before_action: true` MUST pause and await explicit human confirmation before the agent executes. Always set this to `true` for: file deletion, financial transactions, sending emails/DMs, publishing social media posts.

---

## 🔄 Escalation Rules

| Scenario | Agent Action |
|---|---|
| Task unclear or ambiguous | Stop, message Supervisor, request clarification |
| Action would cause irreversible change | Stop, flag as HUMAN_REVIEW_REQUIRED |
| Agent encounters unexpected error 3x | Stop, save error log, notify Supervisor |
| Output confidence < 70% | Include uncertainty flag in result |
| API key / credential requested | NEVER comply — escalate immediately to human |

---

## 📁 File Structure

```
openclaw_agents/
├── _SYSTEM_ARCHITECTURE.md       ← (This file) Master overview
├── supervisor_agent.md           ← Orchestrator role + system prompt
├── research_agent.md             ← Web research + data gathering
├── content_agent.md              ← Video, copy, social media content
├── crypto_trading_agent.md       ← Market analysis + trading logic
├── outreach_agent.md             ← Email, DM, lead generation
└── memory_agent.md               ← Long-term memory + personal assistant
```
