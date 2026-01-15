# Module 11: Google Credentials + Nodes

## Overview
**59-minute comprehensive guide** to setting up OAuth authentication for Google Workspace and mastering Gmail, Google Sheets, Google Docs, and Google Drive integration.

## Module Information
- **Phase**: Phase 3 - Integrations
- **Duration**: 59 minutes
- **Complexity**: ⭐⭐⭐⭐ Intermediate-Advanced
- **Workflows Built**: 4-5 Google integration examples
- **Prerequisites**: Module 10 (Binary Files)

## Learning Objectives

- Set up Google Cloud OAuth credentials (one-time setup)
- Configure authentication for Gmail, Sheets, Drive, Docs, Calendar
- Master Gmail triggers and actions
- Automate Google Sheets operations
- Work with Google Drive file operations
- Build automated reporting workflows

## Google Cloud Setup (CRITICAL)

### Initial OAuth Configuration

**Step-by-step process**:

1. **Google Cloud Console**: `console.cloud.google.com`
2. **Create New Project**: "N8N Google Drive Tutorial" (or your name)
3. **Enable APIs**: API & Services → Library
   - Search for each: Drive, Gmail, Sheets, Docs, Calendar
   - Click "Enable" for each service you'll use
4. **OAuth Consent Screen**:
   - Get Started → External
   - App name: "N8N Google Tutorial"
   - User support email: Your Gmail
   - Developer contact: Your Gmail
   - Save & Continue
5. **Publish App**: Audience tab → "Publish App" (CRITICAL!)
   - Without this: N8N connection fails
6. **Create Credentials**:
   - Create Credentials → OAuth Client ID
   - Application type: Web Application
   - Name: "Google Drive N8N"
   - Authorized redirect URI: Copy from N8N credential screen
   - Create → Save Client ID and Secret

### N8N Credential Setup

1. **In N8N**: Create new Google credential
2. **Paste**:
   - Client ID from Google Cloud
   - Client Secret from Google Cloud
3. **Sign in with Google**
4. **Allow permissions** (Advanced → Go to N8N unsafe)
5. **Select scopes** (check all)
6. **Success!** Connection tested

**Pro Tip**: Label credentials properly! Don't use "Google Account 1"

## Google Services Covered

### 1. Gmail

**Triggers**:
- **On Message Received**: Start workflow when email arrives

**Trigger Options**:
- Poll time: Every minute/hour/day/custom
- Filters: Has attachment, from sender, label
- Read status: Unread only
- Search: Gmail search syntax
- Simplify: ON = basic data, OFF = full email

**Key Actions**:
- **Send Message**: Automated emails
- **Send and Wait**: Interactive workflows
- **Create Draft**: Human-in-the-loop pattern
- **Reply to Message**: Auto-responses
- **Add/Remove Labels**: Organization
- **Mark as Read/Unread**: Status management
- **Delete Message**: Cleanup (use carefully!)
- **Get Message**: Retrieve specific email
- **Get Many**: Bulk retrieval

**Common Patterns**:

**Pattern 1: Process Email Attachments**
```
Gmail Trigger (on message received)
  → Options: Download attachments = ON
  → Filter: Has attachment
  → Extract from File (CSV)
  → Process data
  → Send confirmation email
```

**Pattern 2: AI Email Summary**
```
Gmail Trigger
  → Simplify = OFF (get full content)
  → AI Agent (summarize email)
  → IF (requires action?)
    ├→ TRUE: Create draft reply
    └→ FALSE: Mark as read
```

**Pattern 3: Email Automation**
```
Workflow completes
  → Gmail: Send Message
  → To: stakeholder@company.com
  → Subject: "Report Ready"
  → Attachment: Generated report
  → Options: Remove "sent by N8N" = ON
```

**Gmail Fields**:
- **From**: Sender email
- **To**: Recipient(s)
- **Subject**: Email subject
- **Message**: Email body (HTML or plain text)
- **Attachments**: Binary data field name
- **CC/BCC**: Optional recipients
- **Append N8N attribution**: ON/OFF (turn off for professional emails)

### 2. Google Sheets

**Why Still Used**: Despite Data Tables, Sheets offers:
- External collaboration
- Web access for stakeholders
- Formula capabilities
- Familiar interface

**Triggers**:
1. **On Row Added**: New row triggers workflow
2. **On Row Updated**: Column change triggers workflow
3. **On Row Added or Updated**: Either event triggers

**Trigger Pattern - Status Column**:
```
Google Sheets Trigger (on row updated)
  → Columns to watch: "Status"
  → IF (status = "Ready to Generate")
    ├→ TRUE: Process row data
    └→ FALSE: Do nothing (NoOp)
```

**Key Actions**:
- **Get Rows**: Retrieve data (like SELECT in SQL)
- **Append Row**: Add new row(s)
- **Update Row**: Modify existing data
- **Delete Rows**: Remove records
- **Clear Sheet**: Delete all data
- **Create Spreadsheet**: New file
- **Create/Delete Sheet**: Manage tabs

**Get Rows with Filters**:
```
Google Sheets: Get Rows
  → Document: Select spreadsheet
  → Sheet: Select tab
  → Filters:
    - Column: "Status"
    - Value: "Pending"
  → Returns: Only matching rows
```

**Append vs Update**:
- **Append**: Always adds new row at bottom
- **Update**: Modifies existing row (find by row number or filter)

**Common Pattern: Status-Based Processing**
```
Schedule Trigger (every 5 minutes)
  → Sheets: Get Rows (status = "Pending")
  → Process each item
  → Sheets: Update Row (status = "Complete")
```

### 3. Google Docs

**Use Cases**:
- Template-based document generation
- Automated report creation
- Invoice/contract generation

**Actions**:
- **Create Document**: New Google Doc
- **Get Document**: Retrieve content
- **Update Document**: Modify text

**Template Pattern**:
```
Create Doc with template
  → Use placeholders: {{CUSTOMER_NAME}}
  → Update Document:
    - Replace: {{CUSTOMER_NAME}} → Real name
    - Replace: {{INVOICE_TOTAL}} → Actual amount
```

**Update Options**:
- **Insert at end**: Append content
- **Insert at position**: Specific location
- **Replace text**: Find and replace

### 4. Google Drive

**Triggers**:
- **On File/Folder Change**: Workflow starts when file uploaded/modified

**Common Actions**:
- **Download File**: Get binary data into N8N
- **Upload File**: Save file to Drive
- **Copy File**: Duplicate files
- **Delete File**: Remove files
- **Create Folder**: Organize files
- **Move File**: Reorganize
- **Share File/Folder**: Permissions

**Download File Pattern**:
```
Google Drive: Download File
  → File from list: Select file
  → Returns: Binary data in N8N
  → Use for: Processing, conversion, extraction
```

**Upload File Pattern**:
```
Generate/process file (binary data)
  → Google Drive: Upload File
  → File name: "Report_{{$now}}.pdf"
  → Parent folder: Select destination
  → Binary data: "data" (field name)
```

**Common Use Case - Image Upload Workflow**:
```
Form Trigger (user uploads image)
  → Resize image
  → Upload to Google Drive
  → Share file (get public URL)
  → Return URL to user
```

## Workflow Examples

### Example 1: Weekly Report Generator

```
Schedule Trigger (Monday 9 AM)
  → Google Sheets: Get Rows (filter by date range)
  → Summarize: Count, Average, Sum, Max
  → Gmail: Send Message
    - To: team@company.com
    - Subject: "Weekly Report"
    - Body: Summary stats
```

### Example 2: Email Attachment Processor

```
Gmail Trigger (on message received)
  → Filter: Has attachment + From: clients@
  → Download attachments
  → Extract from CSV
  → Google Sheets: Append Rows
  → Gmail: Reply ("Data received and processed")
```

### Example 3: Status-Based Document Generator

```
Google Sheets Trigger (on row updated)
  → Column watch: "Status"
  → IF (status = "Ready to Generate")
  → Get row data
  → Google Docs: Create from template
  → Replace placeholders with row data
  → Upload to Drive
  → Update Sheet (status = "Complete")
```

## Key Takeaways

- 🎯 **One-time OAuth setup** enables all Google services
- 🎯 **Must publish app** in Google Cloud or connection fails
- 🎯 Gmail: Simplify=OFF for full email content
- 🎯 Sheets: Status column pattern = very common
- 🎯 Drive: Binary data for file uploads/downloads
- 💡 Label credentials properly (avoid "Account 1")
- ⚠️ Download attachments must be enabled in Gmail

## Common Patterns Summary

| Pattern | Services | Use Case |
|---------|----------|----------|
| Email → Process → Reply | Gmail | Customer support automation |
| Sheet → Process → Update | Sheets | Data processing pipeline |
| Generate → Upload → Share | Drive | Report distribution |
| Trigger on Upload | Drive | File processing automation |
| Status column workflow | Sheets | Manual trigger control |

## Troubleshooting

| Issue | Cause | Solution |
|-------|-------|----------|
| OAuth fails | App not published | Publish app in Google Cloud |
| No attachment data | Download not enabled | Turn on "Download attachments" |
| Can't find file | Wrong folder | Verify folder selection |
| Simplify limits data | Simplify = ON | Turn OFF for full email |
| Rate limits | Too many requests | Add delays, batch operations |

## Related Modules

**Prerequisites**:
- [Module 10: Binary Files](../../02-fundamentals/10-binary-files/notes.md) - File handling

**Build on this**:
- [Module 13: HTTP Request](../13-http-request/notes.md) - API patterns
- [Module 14: API Workflows](../14-api-workflows/notes.md) - Advanced integration

## Additional Resources

- [Google Cloud Console](https://console.cloud.google.com)
- [N8N Google Credentials Guide](https://docs.n8n.io/integrations/builtin/credentials/google/)
- Gmail search operators
- Google Sheets formula reference

---

**Module Status**: ✅ Completed  
**Date Completed**: 2026-01-15  
**Time Spent**: 59 minutes  
**Workflows Built**: 4+  
**Next Module**: [Module 12: Documenting Workflows](../12-documenting-workflows/notes.md)
