# Module 18: ChatHub

## Overview
N8N's built-in conversational AI interface for creating personal AI agents, workflow-based chatbots, and multi-model chat experiences.

## Module Information
- **Phase**: Phase 4 - AI Workflows
- **Duration**: 40 minutes
- **Complexity**: ⭐⭐⭐⭐ Intermediate-Advanced
- **Workflows Built**: 2-3 ChatHub examples
- **Prerequisites**: Module 17 (Deeper AI Agents)

## Learning Objectives

- Create personal AI agents in ChatHub
- Build workflow-based chat agents
- Configure multi-model support
- Manage conversation history
- Integrate ChatHub with workflows
- Deploy chatbots for users

## Core Concepts

### What is ChatHub?

**Definition**: N8N's interface for conversational AI

**Two Types of Agents**:
1. **Personal Agents**: Your own AI assistants
2. **Workflow Agents**: Chatbots backed by workflows

**Use Cases**:
- Internal chatbots
- Customer support automation
- Interactive workflows
- AI-powered interfaces

## Personal AI Agents

### Creating Personal Agents

**Setup**:
```
ChatHub → Create Agent
  - Name: My Assistant
  - Model: Choose LLM
  - System Prompt: Define behavior
  - Tools: Optional
```

**Benefits**:
- No workflow needed
- Quick setup
- Personal use
- Model testing

## Workflow-Based Agents

### Chat Trigger Pattern

**Structure**:
```
Chat Trigger
  ↓
AI Agent (with system prompt)
  ↓
Process/Tools
  ↓
Response
```

**Why**: Full workflow control, complex logic

### ChatHub Integration

**Connect Workflow**:
1. Build workflow with Chat Trigger
2. Activate workflow
3. ChatHub → Create Agent → Link to workflow
4. Users chat with your workflow

## Key Features

### Multi-Model Support

- Switch between OpenAI, Claude, Gemini
- Test different models
- Fallback configurations
- Cost optimization

### Memory Management

- Conversation history
- Context retention
- Session management

### Tool Integration

- Gmail, Sheets, Calendar
- Custom tools
- API integrations

## Key Takeaways

- 🎯 ChatHub = Conversational interface for N8N AI
- 🎯 Personal agents for quick testing
- 🎯 Workflow agents for production
- 💡 Connect any workflow with Chat Trigger
- 💡 Great for user-facing chatbots

## Related Modules

**Prerequisites**:
- [Module 17: Deeper AI Agents](../17-ai-agents/notes.md)

**Builds to**:
- [Module 24: Human in the Loop](../../05-advanced-techniques/24-human-in-loop/notes.md)

---

**Module Status**: ✅ Completed  
**Date Completed**: 2026-01-15  
**Time Spent**: 40 minutes  
**Next Module**: [Module 19: Error Handling & Debugging](../19-error-handling/notes.md)
