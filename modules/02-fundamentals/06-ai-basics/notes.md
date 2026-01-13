# Module 06: N8N AI Basics

## Overview
Getting started with AI agents in N8N by learning to connect OpenAI, Anthropic (Claude), and Google Gemini. Build your first AI-powered workflows including a famous birthday matcher.

## Module Information
- **Phase**: Phase 2 - Fundamentals
- **Duration**: 25 minutes
- **Complexity**: ⭐⭐⭐ Intermediate
- **Workflows Built**: 2 (AI agent setup + birthday matcher)
- **Prerequisites**: Module 05 (Triggers)

## Learning Objectives

- Set up AI credentials for OpenAI, Claude, and Google Gemini
- Build basic AI agent workflows  
- Combine forms with AI agents
- Implement fallback models for reliability
- Understand chat trigger + AI agent pattern

## Core Concepts

### AI Model Setup

**OpenAI (GPT)**
1. Go to platform.openai.com/api
2. API Keys → Create new secret key  
3. Copy key (only shown once!)
4. Paste in N8N credential
5. **Label credentials** to avoid confusion
6. Choose model: GPT-4o, GPT-4o-mini (cheaper)

**Anthropic (Claude)**  
1. Go to console.anthropic.com
2. Create API key
3. Add to N8N credentials
4. Models: Claude 3.5 Sonnet (best), Opus (expensive)

**Google Gemini**
1. Go to aistudio.google.com
2. Get API key → Create new
3. Choose cloud project (optional)
4. Add to N8N
5. Model: Gemini 2.0 Flash (recommended)

### Common AI Pattern

```
Chat Trigger → AI Agent (with chat model) → Response
```

**Auto-connection**: Chat trigger automatically populates AI agent prompt with `{{$json.input}}`

### Fallback Models

**Why**: If primary AI service is down, fallback prevents workflow failure

**Setup**:
1. Add primary chat model (e.g., OpenAI)
2. Enable "Fallback Model"
3. Add secondary (e.g., Google Gemini)
4. If OpenAI fails → automatically uses Gemini

**Pro tip**: Essential for production systems that cannot fail

## Key Takeaway

- 🎯Most popular: OpenAI, Anthropic, Google Gemini  
- 🎯 Chat trigger + AI agent is the most common pattern
- 🎯 **Always label credentials** when creating them
- 💡 API costs are low for testing (~$50/month covers extensive use)
- ⚠️ Save API keys immediately - shown only once!

## Project Built: Famous Birthday Matcher

**Requirements**:
1. Form trigger with:
   - Birthday (date picker)
   - Music genres (text)
   - Favorite sports (text)
2. AI agent that finds famous people matching:
   - Same birth month/day
   - Works in specified sports OR
   - Plays specified music genres

**Prompt**:
```
What famous people have a birthday on {{birthday}}?
The famous people must play in these sports: {{sports}}
OR they are a musician and play these styles of music: {{music_genres}}
```

**Result**: AI returns matching celebrities

## Practical Applications

| Use Case | Pattern | Example |
|----------|---------|---------|
| Customer support | Chat → AI Agent | FAQ chatbot |
| Content generation | Form → AI Agent | Blog post writer |
| Data enrichment | API data → AI Agent | Summarize records |
| Research assistant | Manual → AI Agent | Market research |

## Node Features Learned

**Activating/Deactivating Nodes**:
- Right-click node → Deactivate
- Grayed out = not executing
- Useful for testing different models

---

**Module Status**: ✅ Completed  
**Date Completed**: 2026-01-14  
**Workflows Built**: 2  
**Next Module**: [Module 07: JSON Basics](../07-json-basics/notes.md)
