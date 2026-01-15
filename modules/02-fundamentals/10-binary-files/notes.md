# Module 10: N8N Binary Files

## Overview
Working with files (images, PDFs, documents, videos) in N8N. Understanding binary data vs JSON data, file operations, and common file handling patterns.

## Module Information
- **Phase**: Phase 2 - Fundamentals
- **Duration**: 26 minutes
- **Complexity**: ⭐⭐⭐ Intermediate
- **Workflows Built**: 2-3 file handling examples
- **Prerequisites**: Module 08 (Basic Nodes), Module 09 (Data Tables)

## Learning Objectives

- Understand binary data vs JSON data
- Upload and download files
- Extract data from files (CSV, Excel, PDF)
- Process images and videos
- Convert between binary and base64
- Handle file attachments in workflows

## Core Concepts

### Binary Data vs JSON Data

**JSON Data** (what we've been using):
- Text-based data: strings, numbers, objects, arrays
- Visible in N8N interface
- Example: `{"name": "John", "age": 30}`

**Binary Data** (files):
- Files: images, PDFs, videos, documents
- NOT displayed as JSON
- Shown in separate "Binary" tab
- Stored separately from JSON items

**Key Difference**: 
- JSON = workflow data
- Binary = file attachments to that data

### Binary Data Display

**In N8N Interface**:
- Red banner at top shows binary file name
- "Binary" tab shows file preview (if supported)
- JSON tab shows metadata about file
- Can have BOTH JSON data AND binary data

**Example**:
```
Item 1:
  JSON: {filename: "report.pdf", size: 1024}
  Binary: [PDF file data]
```

## Common Binary Operations

### 1. Extract from File

**Purpose**: Read data FROM files (CSV, Excel, JSON, XML)

**Supported Formats**:
- CSV
- Excel (.xlsx, .xls)
- JSON
- XML
- HTML (tables)

**Pattern**:
```
Get file (Gmail attachment, Google Drive, etc.)
  → Extract from File
  → Process extracted data
```

**Example**:
```
Gmail (download attachment "data.csv")
  → Extract from CSV
  → Returns: rows as JSON items
```

### 2. Read/Write Files from Binary Data

**Read Binary Files**:
- Download from Google Drive
- Get email attachments
- HTTP request (download file)
- Form upload

**Write Binary Files**:
- Upload to Google Drive
- Send email attachments
- Create PDFs/images
- Save to external storage

### 3. Convert to File

**Purpose**: Convert JSON data TO files

**Common Conversions**:
- JSON → CSV
- JSON → Excel
- JSON → PDF
- Data → Image (via AI)

**Pattern**:
```
Process data (JSON)
  → Convert to File (CSV)
  → Upload to Google Drive
```

### 4. Image/Video Processing

**Operations**:
- Resize images
- Convert formats
- Extract frames from video
- Compress files
- OCR (text from images)

## File Handling Patterns

### Pattern 1: Email Attachment Processing
```
Gmail Trigger (on message received)
  → Options: Download attachments = ON
  → Extract from File (CSV)
  → Process data
  → Send confirmation email
```

**Use Case**: Automated CSV processing from emails

### Pattern 2: Generate and Upload Report
```
Get data from API
  → Summarize data
  → Convert to File (CSV)
  → Upload to Google Drive
  → Send notification
```

**Use Case**: Weekly reports generation

### Pattern 3: Image Processing
```
Form Trigger (user uploads image)
  → Resize image
  → Convert format
  → Upload to storage
  → Return URL
```

**Use Case**: Image optimization pipeline

### Pattern 4: PDF Generation
```
Get data
  → Format as HTML
  → Convert to PDF
  → Email as attachment
```

**Use Case**: Invoice/receipt generation

## Common File Nodes

### Extract from File
- **CSV**: Parse CSV to JSON items
- **Excel**: Read spreadsheet data
- **JSON**: Parse JSON files
- **XML**: Convert XML to JSON

### Convert to File  
- **CSV**: JSON → CSV file
- **Excel**: JSON → spreadsheet
- **PDF**: HTML/data → PDF
- **Image**: Generate images

### Compression Nodes
- Compress files (ZIP)
- Decompress archives
- Reduce file sizes

### HTTP Request (for files)
- Download files from URLs
- Upload files to APIs
- Response type: "File"

## Key Takeaways

- 🎯 Binary data = files, stored separately from JSON
- 🎯 Red banner shows binary file name
- 🎯 Can have JSON + Binary in same item
- 🎯 Extract from File = Read data FROM files
- 🎯 Convert to File = Create files FROM data
- 💡 Common: Email attachments, Drive files, form uploads
- ⚠️ Binary data tab = separate from JSON tab

## Practical Applications

| Use Case | Pattern | Example |
|----------|---------|---------|
| Process CSV emails | Gmail + Extract | Customer data imports |
| Generate reports | Data + Convert to CSV | Weekly sales reports |
| Image uploads | Form + Process + Upload | Profile picture handling |
| PDF generation | Data + Convert to PDF | Invoices, receipts |
| File backups | Download + Upload | Drive → Backup storage |

## Common Pitfalls

| Pitfall | Problem | Solution |
|---------|---------|----------|
| Missing binary property | Error: "No binary data" | Check red banner for file name |
| Wrong file format | Can't extract | Verify file type matches node |
| File too large | Timeout/memory error | Split processing or compress |
| Forgot to download | No binary data | Enable "download attachments" |

## Binary Data in Different Nodes

**Gmail**:
- Option: "Download attachments"
- Creates binary data automatically
- File name shown in red banner

**Google Drive**:
- Operation: "Download file"
- Returns binary data
- Metadata in JSON, file in Binary

**Form Trigger**:
- File upload field
- Binary data from user upload
- Both file data + form fields

**HTTP Request**:
- Response format: "File"
- Downloads files from URLs
- Binary in response

## File Name Property

**Important**: Binary data has a **property name**

**Red Banner Shows**: `attachment0`, `data`, `file`, etc.

**Usage**: Reference this name in downstream nodes
```
Extract from File:
  Binary Property: "attachment0"
  
Upload to Drive:
  Input data field name: "attachment0"
```

## Related Modules

**Prerequisites**:
- [Module 08: Basic Nodes](../08-basic-nodes/notes.md) - Data operations

**Build on this**:
- [Module 11: Google Integration](../../03-integrations/11-google-credentials/notes.md) - Drive uploads/downloads
- [Module 21: Image & Video AI](../../04-ai-workflows/21-image-video-ai/notes.md) - AI-powered file processing

## Additional Resources

- [N8N Binary Data Documentation](https://docs.n8n.io/data/binary-data/)
- Supported file formats list
- File conversion guide
- Image processing examples

## Hands-On Exercise

**Exercise**: Email CSV Processor
1. Create Gmail trigger
2. Enable "Download attachments"
3. Add Extract from File (CSV)
4. View extracted data
5. Process and send confirmation

**Result**: Understand binary → JSON conversion

---

**Module Status**: ✅ Completed  
**Date Completed**: 2026-01-15  
**Time Spent**: 26 minutes  
**Next Module**: [Module 11: Google Credentials & Nodes](../../03-integrations/11-google-credentials/notes.md)
