# N8N Glossary - Quick Reference

> Essential N8N terminology and concepts

---

## A

**Active Workflow**  
A workflow that is currently enabled and will execute based on its trigger conditions.

**API Key**  
Authentication credential used to access external services via HTTP requests.

**AI Agent**  
Automated system powered by LLMs that can reason, use tools, and execute multi-step tasks.

---

## B

**Binary Data**  
Non-text data like images, PDFs, or files handled differently from JSON data in N8N.

**Batch Processing**  
Processing multiple items together instead of one at a time for efficiency.

---

## C

**Credentials**  
Stored authentication information for connecting to external services (API keys, OAuth tokens, etc.).

**Cron Expression**  
Time-based schedule format used in Schedule Trigger (e.g., `0 9 * * *` = every day at 9 AM).

---

## D

**Data Flow**  
The path data takes through a workflow from trigger to final output node.

**Data Item**  
A single record or object being processed through a workflow.

---

## E

**Embeddings**  
Vector representations of text used in RAG and semantic search systems.

**Error Trigger**  
Special node that executes only when a workflow encounters an error.

**Execution**  
A single run of a workflow from start to finish.

**Expression**  
Code snippets in N8N using `{{ }}` syntax to dynamically access or transform data.

---

## F

**Function Calling**  
AI agent capability to execute predefined tools/functions based on context.

---

## H

**HTTP Request Node**  
Core node for making API calls to external services.

**Human-in-the-Loop**  
Workflow pattern where human approval/input is required before proceeding.

---

## I

**IF Node**  
Conditional logic node that routes data based on true/false conditions.

**IMAP**  
Protocol for reading emails, used in Email Trigger node.

**Item**  
See "Data Item" - a single record in N8N's data structure.

---

## J

**JSON**  
JavaScript Object Notation - the primary data format used in N8N workflows.

---

## L

**LLM (Large Language Model)**  
AI model like GPT-4 used in AI agents and chat workflows.

**Loop Over Items**  
Processing pattern that handles each item individually in sequence.

---

## M

**MCP (Model Context Protocol)**  
Standard for connecting AI agents to external tools and data sources.

**Merge Node**  
Combines data from multiple workflow branches.

---

## N

**Node**  
Individual component in a workflow that performs a specific action.

---

## O

**OAuth**  
Authentication protocol used for secure third-party service connections.

---

## P

**Pagination**  
Technique for retrieving large datasets in smaller chunks across multiple API calls.

**Pin Data**  
Feature to save sample data on a node for testing without re-execution.

**Production Mode**  
Main workflow execution environment (vs. Manual/Test mode).

---

## R

**RAG (Retrieval Augmented Generation)**  
AI pattern combining vector databases with LLMs for context-aware responses.

**Rate Limiting**  
API restriction on number of requests allowed per time period.

---

## S

**Schedule Trigger**  
Trigger node that runs workflows on a time-based schedule.

**Set Node** (Edit Fields)  
Node for adding, modifying, or removing data fields.

**Split Out Node**  
Separates array items into individual items for processing.

**Sub-workflow**  
Reusable workflow called from within another workflow.

---

## T

**Trigger**  
Starting point of a workflow that initiates execution.

**Tool**  
Function or capability available to AI agents for task execution.

---

## V

**Vector Database**  
Specialized database storing embeddings for semantic search in RAG systems.

---

## W

**Webhook**  
HTTP endpoint that receives real-time events from external services.

**Workflow**  
Complete automation sequence from trigger to output.

---

## Common Acronyms

- **API**: Application Programming Interface
- **CRUD**: Create, Read, Update, Delete
- **HTTP**: HyperText Transfer Protocol
- **JSON**: JavaScript Object Notation
- **LLM**: Large Language Model
- **MCP**: Model Context Protocol
- **OAuth**: Open Authorization
- **RAG**: Retrieval Augmented Generation
- **REST**: Representational State Transfer
- **SMTP**: Simple Mail Transfer Protocol
- **VPS**: Virtual Private Server

---

**[Back to References](README.md)** | **[Main README](../README.md)**
