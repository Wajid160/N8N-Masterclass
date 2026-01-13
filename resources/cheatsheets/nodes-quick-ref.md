# N8N Quick Reference - Nodes Cheatsheet

> Fast lookup for commonly used N8N nodes

---

## 🎯 Essential Nodes

### Edit Fields (Set)
**Purpose**: Add, modify, or remove data fields

**Common Uses**:
- Transform data structure
- Add new fields
- Rename fields
- Remove unnecessary data

**Quick Example**:
```
Field: name
Value: {{ $json.firstName }} {{ $json.lastName }}
```

---

### IF (Conditional Logic)
**Purpose**: Route data based on conditions

**Conditions**:
- String: equals, contains, regex
- Number: >, <, ==, !=
- Boolean: true/false
- Exists: field presence check

**Tips**:
- Chain multiple IFs for complex routing
- Use Switch node for 3+ conditions

---

### Code (JavaScript/Python)
**Purpose**: Custom logic when nodes aren't enough

**JavaScript Example**:
```javascript
for (const item of items) {
  item.json.processedAt = new Date();
}
return items;
```

**When to Use**:
- Complex transformations
- Custom calculations
- Data validation

---

### HTTP Request
**Purpose**: Call external APIs

**Settings**:
- URL: API endpoint
- Method: GET, POST, PUT, DELETE
- Authentication: None, Basic, OAuth
- Headers: Custom headers
- Body: Request payload

**Quick GET**:
```
URL: https://api.example.com/users
Method: GET
```

---

### Split Out
**Purpose**: Convert array to individual items

**Example**:
```
Input: { users: [{name: "A"}, {name: "B"}] }
Output: Item 1: {name: "A"}, Item 2: {name: "B"}
```

**Use Case**: Process each array element separately

---

### Merge
**Purpose**: Combine data from multiple sources

**Modes**:
- **Append**: Stack items
- **Combine**: Join by key
- **Choose Branch**: Select one path

**Pattern**:
```
Branch A ──┐
           ├──> Merge
Branch B ──┘
```

---

## 🔍 Data Transformation

### Filter
**Purpose**: Keep only items matching conditions

**Use**: Remove unwanted data early in workflow

### Aggregate
**Purpose**: Group and summarize data

**Operations**: Sum, average, count, min, max

### Sort
**Purpose**: Order items by field value

**Tip**: Case-sensitive by default

---

## 🤖 AI Nodes

### AI Agent
**Purpose**: Intelligent task automation

**Components**:
- Chat Model (OpenAI, etc.)
- Tools (functions agent can use)
- Memory (conversation history)

**Quick Setup**:
1. Select model (GPT-4, GPT-3.5)
2. Add tools if needed
3. Configure system prompt

---

### Chat Model
**Purpose**: Direct LLM interaction (no agent logic)

**vs Agent**: Use when you don't need tool calling

---

### Embeddings
**Purpose**: Convert text to vectors for RAG

**Models**: OpenAI, HuggingFace

**Use**: Building vector databases

---

## 📧 Communication

### Gmail
**Actions**: Send email, read email, search

**Send Quick Email**:
```
To: user@example.com
Subject: Alert
Body: {{ $json.message }}
```

### Slack
**Actions**: Send message, upload file

### Email (SMTP/IMAP)
**SMTP**: Send emails
**IMAP**: Receive and read emails

---

## 📊 Google Workspace

### Google Sheets
**Actions**: Append, update, lookup, delete

**Common Pattern**:
```
Trigger → Process Data → Append to Sheet
```

### Google Drive
**Actions**: Upload, download, share, delete

### Google Calendar
**Actions**: Create event, list events

---

## 🔄 Control Flow

### Wait
**Purpose**: Pause execution

**Modes**:
- Time: Wait X seconds
- Webhook: Wait for external trigger

**Use**: Rate limiting, scheduled delays

---

### Loop Over Items
**Purpose**: Process items sequentially

**vs Split Out**: Loop processes one at a time, Split Out all at once

---

### Execute Workflow
**Purpose**: Call sub-workflows

**Benefits**: Reusable logic, cleaner main workflow

---

## 🗄️ Data Storage

### Postgres/MySQL
**Purpose**: Database operations

**Actions**: Query, insert, update, delete

### Google Sheets (as Database)
**Pros**: Easy, no server needed
**Cons**: Slower, limited features

---

## ⚡ Triggers

### Manual Trigger
**Use**: Testing and on-demand execution

### Schedule Trigger
**Cron**: `0 9 * * *` = Daily at 9 AM

**Quick Patterns**:
- Every hour: `0 * * * *`
- Every day: `0 9 * * *`
- Every Monday: `0 9 * * 1`

### Webhook Trigger
**Use**: Real-time event processing

**URL**: Provided after workflow activation

### Email Trigger (IMAP)
**Use**: Process incoming emails automatically

---

## 🔧 Utility Nodes

### No Operation (NoOp)
**Use**: Placeholder or comment

### Stop and Error
**Use**: Halt execution with custom error

### Item Lists
**Actions**: Limit, remove duplicates, sort

---

## 🎨 Expressions Cheatsheet

### Access Data
```javascript
{{ $json.fieldName }}              // Current item field
{{ $json.nested.field }}           // Nested field
{{ $json.array[0] }}               // Array element
{{ $node["NodeName"].json.field }} // From specific node
```

### Conditional
```javascript
{{ $json.status === 'active' ? 'Yes' : 'No' }}
```

### String Manipulation
```javascript
{{ $json.name.toLowerCase() }}
{{ $json.email.toUpperCase() }}
{{ $json.text.trim() }}
{{ $json.text.includes('keyword') }}
```

### Date/Time
```javascript
{{ $now }}                    // Current timestamp
{{ $today }}                  // Today's date
{{ new Date().toISOString() }} // ISO format
```

### Math
```javascript
{{$json.price * 1.1 }}        // Add 10%
{{ Math.round($json.value) }}  // Round number
```

---

## 💡 Pro Tips

### Performance
- Use binary mode for files
- Batch API calls
- Pin data for testing

### Debugging
- Pin data at problem nodes
- Check execution logs
- Use NoOp to isolate issues

### Best Practices
- Name nodes descriptively
- Add sticky notes for complex logic
- Use sub-workflows for reusability

---

**Need More?** Check [N8N Official Docs](https://docs.n8n.io/integrations/builtin/core-nodes/)

**[Back to Resources](../resources/)** | **[Main README](../README.md)**
