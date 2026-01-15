# Module 09: N8N Data Tables

## Overview
Native N8N database storage - an alternative to Google Sheets/Airtable that requires NO external API calls. Store data internally for testing, caching, and lightweight database needs.

## Module Information
- **Phase**: Phase 2 - Fundamentals
- **Duration**: 31 minutes
- **Complexity**: ⭐⭐⭐ Intermediate
- **Workflows Built**: 2-3 data table examples
- **Prerequisites**: Module 08 (Basic Nodes)

## Learning Objectives

- Understand Data Tables as N8N's native database
- Create and structure data tables
- Perform CRUD operations (Create, Read, Update, Delete)
- Compare Data Tables vs Google Sheets vs Airtable
- Implement data tables for workflow logging
- Use data tables for testing without external services

## Core Concepts

### What Are Data Tables?

**Definition**: Built-in database storage directly in N8N - like Google Sheets but native to N8N.

**Key Benefits**:
- ✅ **No API calls** = Faster execution
- ✅ **No external costs** = Free storage
- ✅ **Built-in** = No authentication needed
- ✅ **Perfect for testing** = No external dependencies
- ✅ **Workflow logging** = Track executions internally

**Limitations**:
- ⚠️ Only available on Starter plan and above
- ⚠️ Not available on Pro plan (check current pricing)
- ⚠️ Not suited for massive datasets (use real database)
- ⚠️ Limited to N8N ecosystem

### Creating Data Tables

**Access**: 
- Main menu → Data Tables tab
- Or "Create Data Table" button (top right)

**Table Structure**:
- Define columns with data types
- Set primary keys (optional)
- Similar to creating a spreadsheet

**Column Types**:
- String (text)
- Number
- Boolean (true/false)
- Date/Time
- JSON

### Operations Available

**1. Insert Rows**
- Add new records to table
- Batch insert multiple rows
- Auto-increment IDs

**2. Get Rows** 
- Query data from table
- Filter results
- Limit results
- Sort by columns

**3. Update Rows**
- Modify existing records
- Find by ID or conditions
- Batch updates

**4. Delete Rows**
- Remove records
- Filter which rows to delete
- Careful with bulk deletes!

## Data Tables vs Alternatives

| Feature | Data Tables | Google Sheets | Airtable |
|---------|-------------|---------------|----------|
| **Setup** | Built-in | OAuth required | API key needed |
| **API Calls** | None | Yes | Yes |
| **Speed** | Fastest | Slower | Slower |
| **Cost** | Free | Free tier | Paid plans |
| **Querying** | Native | Limited | Advanced |
| **External Access** | N8N only | Web accessible | Web accessible |
| **Collaboration** | No | Yes | Yes |
| **Best For** | Testing, logs | Collaboration | Advanced DBs |

## Common Use Cases

### 1. Workflow Execution Logging

**Pattern**:
```
Workflow runs
  → Log success/failure to Data Table
  → Track: timestamp, status, error message
```

**Benefits**: Historical tracking without external services

### 2. Testing Workflows

**Pattern**:
```
Development workflow
  → Use Data Tables instead of Google Sheets
  → Test logic without API limits
  → Switch to Sheets/Airtable for production
```

**Benefits**: Faster iteration, no API costs during dev

### 3. Temporary Data Storage

**Pattern**:
```
API call returns 100 items
  → Store in Data Table
  → Process over multiple workflow runs
  → Delete when complete
```

**Benefits**: Persistence between workflow executions

### 4. Configuration Storage

**Pattern**:
```
Store workflow settings in Data Table
  → Read config at workflow start
  → Dynamic behavior based on stored values
```

**Benefits**: Change behavior without editing workflow

## Key Takeaways

- 🎯 Data Tables = N8N's native database (like internal Google Sheets)
- 🎯 **Zero API calls** = Faster + cheaper than external services
- 🎯 Perfect for testing before switching to production databases
- 💡 Great for workflow logging and execution tracking
- ⚠️ Not a replacement for full databases (Postgres, MySQL)
- ⚠️ Plan availability varies - check N8N pricing

## Practical Applications

**Testing Phase**:
- Use Data Tables during development
- Switch to Google Sheets/Airtable for production
- No authentication headaches

**Logging**:
- Error tracking
- Execution history
- Performance monitoring

**Caching**:
- Store API responses temporarily
- Reduce external API calls
- Speed up repeated queries

## Common Patterns

### Pattern 1: Simple Logging
```
Any Workflow
  → Insert Row to Data Table
    - timestamp: {{$now}}
    - status: "success"
    - items_processed: {{$json.count}}
```

### Pattern 2: Read-Process-Update
```
Get Rows from Data Table (status = "pending")
  → Process each item
  → Update Row (set status = "complete")
```

### Pattern 3: Development to Production
```
DEVELOPMENT:
  Data Tables for storage
  
PRODUCTION:
  Replace Data Tables node with Google Sheets
  (Same logic, different storage)
```

## Comparison with Google Sheets

**When to use Data Tables**:
- Testing/development
- Internal logging
- No need for external access
- Want fastest performance

**When to use Google Sheets**:
- Need collaboration
- Want web access to data
- Stakeholders need visibility
- Complex formulas needed

## Related Modules

**Prerequisites**:
- [Module 08: Basic Nodes](../08-basic-nodes/notes.md) - CRUD operations

**Build on this**:
- [Module 10: Binary Files](../10-binary-files/notes.md) - File handling
- [Module 11: Google Integration](../../03-integrations/11-google-credentials/notes.md) - When to graduate to Sheets

**Compare to**:
- Google Sheets (Module 11) - External alternative
- Airtable - Advanced database alternative

## Additional Resources

- [N8N Data Tables Documentation](https://docs.n8n.io/data/data-tables/)
- Data Tables pricing information
- Migration guide: Data Tables → Google Sheets

## Migration Strategy

**Development → Production**:
1. Build workflow with Data Tables
2. Test all logic
3. When ready for production:
   - Replace "Data Tables" nodes with "Google Sheets"
   - Map columns appropriately
   - Test once more
4. Deploy!

**Benefits**: Develop faster without auth setup

---

**Module Status**: ✅ Completed  
**Date Completed**: 2026-01-15  
**Time Spent**: 31 minutes  
**Next Module**: [Module 10: Binary Files](../10-binary-files/notes.md)
