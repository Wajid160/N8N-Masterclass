# Module 08: N8N Nodes (Basic)

## Overview
**CRITICAL MODULE - 70 minutes**: Master the essential nodes that form the foundation of every N8N workflow. This is the most important fundamentals module covering ~10 core nodes you'll use in 95% of workflows.

## Module Information
- **Phase**: Phase 2 - Fundamentals
- **Duration**: 70 minutes (LONGEST fundamentals module)
- **Complexity**: ⭐⭐⭐⭐ Intermediate-Advanced (CRITICAL)
- **Workflows Built**: 10+ node examples + 2 complete workflows
- **Prerequisites**: Module 07 (JSON Basics)

## Learning Objectives

- Master Edit Fields (Set) node for data manipulation
- Build conditional logic with IF and Switch nodes
- Filter and limit data effectively
- Work with dates and times
- Remove duplicates from workflows
- Split arrays into items and aggregate back
- Combine data from multiple branches with Merge
- Understand when to use each node type

## Core Nodes Covered

### 1. Edit Fields (Set) - **MOST USED NODE**

**Purpose**: Transform, rename, create, or remove fields

**Common Use Cases**:
1. **Rename fields**: `name` → `firstName`
2. **Create new fields**: Combine `firstName` + `lastName`
3. **Clean up data**: Remove unwanted fields from spreadsheets
4. **Modify fields**: Add or transform values
5. **Testing**: Create sample data

**Options**:
- **Include other input fields**: Passes all fields + new ones
- **Selected fields**: Choose specific fields to include
- **All except**: Include everything except specified fields
- **Strip binary data**: Remove file data
- **Support dot notation**: Access nested objects

**Pro Tips**:
- Use after Google Sheets to clean columns
- Essential for API response cleanup
- Perfect for testing with sample data

### 2. IF Node - Conditional Branching

**Purpose**: Route data to TRUE or FALSE branches based on conditions

**Data Types Supported**:
- **String**: equals, contains, starts with, ends with, regex
- **Number**: equals, greater than, less than, >=, <=
- **Boolean**: is true, is false
- **Array**: contains, length equals, length >, length <
- **Date/Time**: is after, is before, is equal to
- **Object**: exists or not

**String Operations**:
```
- Equal to: "goose" = "goose" → TRUE
- Contains: "goose" contains "os" → TRUE
- Starts with: "goose" starts with "g" → TRUE
- Ends with: "goose" ends with "e" → TRUE
- Ignore case: "GOOSE" = "goose" (with ignore case ON)
```

**Number Operations**:
```
- Equal to: 1000000 = 1000000 → TRUE
- Greater than: 1000000 > 999999 → TRUE
- Less than: 1000000 < 50 → FALSE
- Greater/equal: 100 >= 100 → TRUE
```

**Array Operations**:
```
- Contains: ["rock", "metal"] contains "rock" → TRUE
- Length equals: array.length = 2 → TRUE
- Length >: array.length > 5 → FALSE
```

**Important Notes**:
- Cannot pin data in IF node (control flow limitation)
- All incoming data passes to TRUE or FALSE branch
- Data types must match (string vs number errors common)

### 3. Switch Node - Multiple Branches

**Purpose**: Route to 3+ branches instead of just TRUE/FALSE

**Key Features**:
- Add unlimited routing rules
- Rename outputs (e.g., "Rock", "Metal", "Bluegrass")
- **Fallback output**: Catch items that don't match any rule
- **Send to all matching**: Item can go to multiple branches

**Pattern**:
```
Input → Switch
  ├→ Route 1 (Rock)
  ├→ Route 2 (Metal)
  ├→ Route 3 (Bluegrass)
  └→ Fallback (Miscellaneous)
```

**When to Use**:
- 3+ conditional paths needed
- Categorizing data (genres, statuses, priorities)
- Alternative to nested IF statements

### 4. Filter Node - Remove Items

**Purpose**: Keep only items that meet criteria, filter out the rest

**How It Works**:
- 100 items → Filter (keep if price > $50) → 25 items
- Items that DON'T meet criteria are removed
- Similar conditions to IF node (string, number, date, array)

**AND vs OR Logic**:
- **AND**: ALL conditions must be true
  - `number > 55 AND number < 75` → Only 66
- **OR**: ONE condition must be true
  - `number > 55 OR number < 20` → 66, 77, 11

**Common Patterns**:
- Filter spreadsheet data before processing
- Remove invalid entries
- Keep only specific date ranges
- Data quality cleanup

### 5. Limit Node - Restrict Item Count

**Purpose**: Keep only first N or last N items

**Options**:
- **Max items**: How many to keep (e.g., 3)
- **Keep**: First items or last items

**Use Cases**:
- Testing workflows (limit to 5 items instead of 1000)
- "Top 10" lists
- Recent items only
- Pagination control

**Pro Tip**: Essential for testing - don't send 1000 items through AI when testing!

### 6. Date & Time Node - Format and Manipulate Dates

**Operations**:
1. **Format date**: Change display format (MM/DD/YYYY vs YYYY-MM-DD)
2. **Extract part**: Get just month, year, day, hour
3. **Add to date**: +180 days, +3 hours
4. **Subtract from date**: -30 days
5. **Get current date**: Alternative to `{{$now}}`
6. **Time between dates**: Calculate difference

**Common Formats**:
- `MM/DD/YYYY` - US format
- `YYYY-MM-DD` - ISO format
- `YYYY-MM-DD HH:mm:ss` - With timestamp
- Custom formats available

**Pro Tips**:
- Use for comparing dates in IF nodes
- Essential for scheduling and time-based logic
- Workflow timezone setting matters!

### 7. Remove Duplicates Node

**Purpose**: Eliminate repeated items

**Modes**:
1. **Within current input**: Remove dupes in this execution (MOST COMMON)
2. **Previous executions**: Never process same item twice
3. **Clear history**: Reset deduplication memory

**How It Works**:
- Compare selected fields (e.g., email, ID)
- Keep first occurrence, remove rest
- 9 items with dupes → 6 unique items

**Use Cases**:
- Clean spreadsheet data
- Ensure unique email sends
- CRM contact deduplication
- Prevent duplicate API calls

### 8. Split Out Node - Array to Items

**Purpose**: Convert array into individual items

**Pattern**:
```
1 item with array [55, 21, 66, 77]
  ↓ Split Out
4 separate items: 55 | 21 | 66 | 77
```

**Options**:
- **Field to split**: Which array to split
- **Include other fields**: Bring along other data
- **Selected fields**: Choose specific fields to include

**Icon Meaning**: Shows 1 → many (one item becoming multiple)

**Common After**:
- Split array from API
- Process each item individually
- Then use IF/Filter on each item

### 9. Aggregate Node - Items to Array

**Purpose**: Opposite of Split Out - combine many items into one array

**Pattern**:
```
6 items: 55 | 21 | 66 | 77 | 22 | 11
  ↓ Aggregate
1 item with array [55, 21, 66, 77, 22, 11]
```

**Options**:
- Rename output field
- Merge lists
- Include binary files
- Keep missing/null values

**Use Case**:
- Collect data from loop
- Prepare array for next step
- Combine processed items

### 10. Summarize Node - Aggregate with Stats

**Purpose**: Aggregate PLUS calculate statistics

**Aggregation Types**:
- **Append**: Create array (like Aggregate)
- **Average**: Calculate mean
- **Concatenate**: Join as string with separator
- **Count**: How many items
- **Count Unique**: Unique items only
- **Max**: Find maximum value
- **Min**: Find minimum value
- **Sum**: Add all values

**Concatenate Separators**:
- Comma: `55, 21, 66, 77`
- Comma + space: `55, 21, 66, 77`
- New line: Each on own line (`\n`)
- Space: `55 21 66 77`
- Custom: `55---21---66---77`
- None: `55216677`

**Why Better Than Aggregate**:
- Can format output (line breaks, separators)  
- Perfect for email newsletters
- Statistics calculation
- Send formatted lists to AI

**Example Stats**:
```
Items: [55, 21, 66, 77, 22, 11, 22, 21, 11]
- Count: 9
- Average: 34
- Count unique: 6 (3 dupes)
- Max: 77
- Min: 11
- Sum: 306
```

### 11. Merge Node (Covered in workflows)

**Purpose**: Combine data from multiple branches

**Common in**: Database joins, combining API responses, parallel processing

## Key Takeaways

- 🎯 **Edit Fields** = Most used node (data transformation)
- 🎯 **IF** = 2 paths (TRUE/FALSE)
- 🎯 **Switch** = 3+ paths (multiple routes)
- 🎯 **Filter** = Remove unwanted items
- 🎯 **Limit** = Essential for testing
- 🎯 **Summarize** > Aggregate (more features)
- ⚠️ Data types must match (string ≠ number errors)
- 💡 Split Out → Process → Aggregate = common pattern

## Common Patterns

### Pattern 1: Clean Spreadsheet Data
```
Google Sheets
  → Edit Fields (remove columns)
  → Remove Duplicates
  → Filter (valid emails only)
  → Process...
```

### Pattern 2: Conditional Processing
```
Trigger
  → IF (price > $100?)
    ├→ TRUE: Send to premium queue
    └→ FALSE: Send to standard queue
```

### Pattern 3: Categorize with Switch
```
Data
  → Switch (by status)
    ├→ "Pending": Notify team
    ├→ "Complete": Archive
    ├→ "Failed": Alert + Retry
    └→ Fallback: Log unknown status
```

### Pattern 4: Array Processing
```
API (returns array of 100 items)
  → Split Out (100 items)
  → Filter (keep valid only) (50 items)
  → Edit Fields (transform)
  → Summarize (back to 1 item with array)
  → Send to next API
```

### Pattern 5: Testing Workflow
```
Large Data Source
  → Limit (5 items) ← Testing only!
  → Process...
  → (Remove limit for production)
```

## Common Mistakes

| Mistake | Problem | Solution |
|---------|---------|----------|
| String vs Number | "100" ≠ 100 causes errors | Convert types in Edit Fields |
| Forgetting fallback in Switch | Lose unmatched data | Always add fallback output |
| Not using Limit when testing | Waste API calls/tokens | Limit to 5-10 items during dev |
| Using Aggregate instead of Summarize | Can't format output | Use Summarize for more control |
| Pinning data in IF | Not possible | Pin before IF node |

## Practical Applications

| Node | Real-World Use | Example |
|------|----------------|---------|
| Edit Fields | Clean API responses | Remove unnecessary fields |
| IF | Price-based logic | If price > $100, premium shipping |
| Switch | Status routing | Pending/Complete/Failed paths |
| Filter | Data quality | Keep only verified emails |
| Limit | Testing | Test with 10 records vs 10,000 |
| Date & Time | Scheduling | Process if date > today |
| Remove Duplicates | CRM cleanup | Unique contacts only |
| Split Out | Process array items | Each product individually|
| Summarize | Create reports | Sum sales, count orders |

## Hands-On Exercises

**Exercise 1**: Data Cleanup
1. Create array of mixed numbers with duplicates
2. Split Out to items
3. Remove Duplicates
4. Filter (keep only > 50)
5. Summarize to get count, average, max

**Exercise 2**: Conditional Routing
1. Create data with "genre" field
2. Use Switch to route by genre
3. Add fallback for unknown genres

**Exercise 3**: Date Logic
1. Create field with various dates
2. Use Date & Time to format
3. Filter to keep only future dates
4. Count how many qualify

## Related Modules

**Prerequisites**:
- [Module 07: JSON Basics](../07-json-basics/notes.md) - CRITICAL foundation

**Build on this**:
- [Module 09: Data Tables](../09-data-tables/notes.md) - Store data internally
- [Module 10: Binary Files](../10-binary-files/notes.md) - Work with files
- [Module 14: API Workflows](../../03-integrations/14-api-workflows/notes.md) - Advanced patterns

## Additional Resources

- [N8N Node Documentation](https://docs.n8n.io/integrations/builtin/core-nodes/)
- Individual node videos on instructor's YouTube channel (20-40 min each)
- IF Node deep dive
- Filter vs Switch comparison
- Date & Time formatting guide

## Module Summary

This 70-minute module is **THE FOUNDATION** for all N8N work. These 10 nodes appear in 95% of workflows. Master them now, and everything else becomes easier.

**Priority**: Learn in order:
1. Edit Fields (daily use)
2. IF (conditional logic)
3. Filter (data cleanup)
4. Split Out + Summarize (array handling)
5. Others as needed

---

**Module Status**: ✅ Completed  
**Date Completed**: 2026-01-15  
**Time Spent**: 70 minutes  
**Nodes Mastered**: 10+  
**Next Module**: [Module 09: N8N Data Tables](../09-data-tables/notes.md)
