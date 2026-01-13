# Module 04: Core Concepts

## Overview
Understanding the fundamental building blocks of N8N workflows: triggers, nodes, data flow, and the anatomy of a workflow. Build your first real automation to solidify these concepts.

## Module Information
- **Phase**: Phase 1 - Foundation  
- **Duration**: 23 minutes
- **Complexity**: ⭐⭐ Beginner-Intermediate
- **Workflows Built**: 1 (Hello World workflow)
- **Prerequisites**: Module 03 (Interface Tour)

## Learning Objectives

After completing this module, you will be able to:
- Understand what triggers are and when to use different types
- Grasp how data flows through N8N workflows
- Recognize different node types and their purposes
- Build your first workflow from scratch
- Understand input/output/parameters structure
- Work with JSON, table, and schema views

## Core Concepts

### Concept 1: Triggers - Starting Your Workflow

**What is a Trigger?**
Every workflow MUST start with a trigger. It's the event that initiates automation execution.

**Common Trigger Types:**

**1. Manual Trigger** (80% used in testing)
- Click "Execute Workflow" to run
- Perfect for development and testing
- No automated execution

**2. App Event**
- Triggered by events in external apps
- Examples: New CRM contact, incoming email, form submission
- Hundreds/thousands of app integrations available

**3. Schedule**
- Time-based automation
- Examples:
  - Run at 9 AM on business days
  - Execute 3x daily (9 AM, noon, 5 PM)
  - Cron expressions for complex schedules

**4. Webhook**
- For apps NOT in N8N's app event list
- Real-time event processing  
- Requires more complex setup (covered in own module)

**5. Other Triggers:**
- Form trigger (web forms)
- Execute Workflow trigger (workflow calls another)
- Chat message trigger
- Email trigger (IMAP)
- Error trigger
- MCP trigger
- N8N trigger (handle N8N instance events)
- SSE trigger

### Concept 2: Nodes - The Building Blocks

**What are Nodes?**
Individual components that perform specific actions in your workflow.

**Node Categories:**

**AI Nodes:**
- AI Agent
- Chat Model
- Text Classifier
- Embeddings
- Image/Video AI

**Actions in Apps:**
- Thousands of integrations
- Official nodes (maintained by companies)
- Community nodes (check mark = verified)

**Data Transformations:**
- Edit Fields (Set) - MOST USED
- Combine Items
- Convert Data
- Filter
- Aggregate
- Sort

**Flow Control:**
- IF (conditional routing)
- Switch
- Loop Over Items
- Merge

**Core Nodes:**
- HTTP Request (API calls)
- Code (JavaScript/Python)
- Split Out
- NoOp (placeholder/comment)

### Concept 3: Data Flow in N8N

**How Data Moves:**
```
Trigger → Node 1 → Node 2 → Node 3 → Output
```

**Key principles:**
1. Data flows left to right (or top to bottom)
2. Each node receives input from previous node
3. Each node processes and outputs data
4. Output becomes input for next node

**Example Flow:**
```
Manual Trigger 
  → Edit Fields (add "name" field)
    → Edit Fields (add "location" field)  
      → Output (name + location)
```

### Concept 4: Node Structure (Input/Settings/Output)

**Every node has 3 sections:**

**1. INPUT (Left side)**
- Data coming FROM previous node
- Shows what the node receives
- Can pin data for testing

**2. NODE SETTINGS (Middle)**
- Parameters and configuration
- Options specific to that node
- Where you configure behavior

**3. OUTPUT (Right side)**
- Data going TO next node
- Shows result after processing
- Three views available:
  - **Schema**: Data structure overview
  - **Table**: Spreadsheet-like view
  - **JSON**: Raw data format

### Concept 5: Working with Data Views

**Schema View:**
- Visual representation of data structure
- Shows field types
- Easiest for beginners

**Table View:**
- Spreadsheet format
- Good for reviewing multiple items
- Easy to scan

**JSON View:**
- Raw data format
- Most commonly used
- Essential for advanced work
- Shows exact data structure

**Binary View:**
- For files (images, PDFs, etc.)
- Covered in Module 10

## Key Takeaways

- 🎯 Every workflow MUST start with a trigger
- 🎯 Triggers determine WHEN automation runs
- 🎯 Nodes determine WHAT the automation does
- 🎯 Data flows sequentially through nodes
- ⚠️ Understanding JSON is critical (covered in Module 07)
- 💡 Manual trigger is your best friend for testing

## Your First Workflow Built

**Workflow: Simple Data Transformation**

```
Manual Trigger
  ↓
Edit Fields (Set)
  - Add field: "name" = "Your Name"
  ↓
Edit Fields (Set)  
  - Add field: "location" = "Your City"
  ↓
View output (name + location data)
```

**What you learned:**
- How to add trigger
- How to add nodes
- How to configure Edit Fields
- How data accumulates through nodes
- How to view output in different formats

## Practical Applications

### Real-World equivalents
- **Manual Trigger** = Running a Python script manually
- **Schedule Trigger** = Cron jobs
- **Webhook Trigger** = API endpoints
- **App Event** = Database triggers or event listeners

### When to Use Each Trigger
| Trigger | Use Case | Example |
|---------|----------|---------|
| Manual | Testing, on-demand | Generate report when needed |
| Schedule | Regular automation | Daily backup at 2 AM |
| App Event | React to changes | New Salesforce lead → send email |
| Webhook | Real-time integration | Payment received → fulfill order |

## Common Mistakes

| Mistake | Impact | Solution |
|---------|--------|----------|
| Forgetting to add trigger | Workflow won't run | Always start with trigger|
| Not understanding data flow | Errors in workflow logic | Trace data through each node |
| Ignoring JSON structure | Can't access data correctly | Learn JSON basics (Module 07) |
| Skipping output review | Miss errors or unexpected results | Check output at each node |

## Related Modules

**Prerequisites:**
- [Module 03: N8N Interface Tour](../03-interface-tour/notes.md) - Navigation basics

**Build on this:**
- [Module 05: Common N8N Triggers](../../02-fundamentals/05-common-triggers/notes.md) - Deep dive into triggers
- [Module 07: JSON Basics](../../02-fundamentals/07-json-basics/notes.md) - CRITICAL for data manipulation
- [Module 08: N8N Nodes (Basic)](../../02-fundamentals/08-basic-nodes/notes.md) - Master essential nodes

## Additional Resources

- [N8N Triggers Documentation](https://docs.n8n.io/integrations/builtin/core-nodes/n8n-nodes-base.trigger/)
- [Understanding Data Flow](https://docs.n8n.io/data/)
- [Node Reference](https://docs.n8n.io/integrations/builtin/)

## Personal Notes

### First Workflow Experience
**What worked well:**
- [Your notes on building first workflow]

**Challenges faced:**
- [Any confusion or difficulties]

### Key Realizations
- Triggers vs Nodes distinction
- Importance of data flow understanding
- Power of Edit Fields node

### Questions for Further Study
- How do I access data from previous nodes?
- When should I use different trigger types?
- How complex can workflows get?

**Answers:** Next modules will cover all of these!

---

**Module Status**: ✅ Completed  
**Date Completed**: 2026-01-14  
**Time Spent**: 23 minutes  
**Workflows Built**: 1  
**Next Module**: [Module 05: Common N8N Triggers](../../02-fundamentals/05-common-triggers/notes.md)
