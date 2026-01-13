# Module 05: Common N8N Triggers

## Overview
Deep dive into the most frequently used triggers: Manual, Schedule, Chat, and Form triggers. Learn when and how to use each trigger type and common patterns for combining triggers.

## Module Information
- **Phase**: Phase 2 - Fundamentals  
- **Duration**: 21 minutes
- **Complexity**: ⭐⭐ Intermediate
- **Workflows Built**: 2-3 trigger examples
- **Prerequisites**: Module 04 (Core Concepts)

## Learning Objectives

- Master manual and schedule triggers for testing and automation
- Build chat-triggered workflows with AI agents
- Create interactive N8N forms with multiple field types
- Combine multiple triggers in a single workflow
- Style and customize forms using AI assistance

##Core Concepts

### Manual Trigger
- **Use**: 80% of testing workflows
- **Pattern**: Always pair with schedule trigger in production
- **Benefit**: On-demand execution without automation

### Schedule Trigger  
**Intervals Available:**
- Seconds, Minutes, Hours, Days, Weeks, Months
- Custom cron expressions (advanced)
  
**Common Patterns:**
- Daily at 9 AM: Business day rules
- 3x daily: 9 AM, noon, 5 PM  
- Weekly reports: Every Friday
- Monthly reports: 1st of month

**Rules System:**
- Multiple rules supported
- Complex schedules without cron knowledge

### Chat Trigger
**Purpose**: Start workflows from ChatHub or chat interfaces

**Common Pattern:**
```
Chat Trigger → AI Agent → Response
```

**Features:**
- Automatically connects to AI Agent
- JSON.input populated by default
- Open chat window for testing
- Perfect for conversational workflows

### Form Trigger
**Elements Available:**
- Text (short input)
- Text Area (long input)
- Checkbox (single/multiple selection)
- Dropdown (predefined options)
- Date picker
- Email (validated)
- Number (numeric only)
- Radio buttons
- Hidden fields
- Custom HTML

**Pro Tips:**
- Use required fields for essential data
- Limit checkbox selections (exact number)
- Style with AI-generated CSS
- Test URL vs Production URL
- Pass form data to Edit Fields for processing

## Key Takeaways

- 🎯 Combine Manual + Schedule triggers in same workflow
- 🎯 Chat triggers auto-connect to AI Agents  
- 🎯 Forms support 10+ element types
- 💡 Use AI (Claude/ChatGPT) to style forms quickly
- ⚠️ Be careful with production URLs

## Assignment Completed

**Built a job application form with:**
1. **Job Title** - Text field
2. **Job Description** - Text area
3. **Join Date** - Date picker
4. **Work Email** - Email field (validated)
5. **Salary** - Number field

**Then**: Passed all form data into Edit Fields node

## Practical Applications

| Trigger | Real-World Use | Example |
|---------|----------------|---------|
| Manual | On-demand reports | Generate monthly report when needed |
| Schedule | Regular automation | Daily social media posts at 8 AM |
| Chat | Customer support | AI chatbot for FAQs |
| Form | Lead capture | Contact forms, surveys, applications |

---

**Module Status**: ✅ Completed  
**Date Completed**: 2026-01-14  
**Workflows Built**: 3  
**Next Module**: [Module 06: N8N AI Basics](../06-ai-basics/notes.md)
