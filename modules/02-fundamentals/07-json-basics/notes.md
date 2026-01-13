# Module 07: JSON Basics and Data Types

## Overview
**CRITICAL MODULE**: Understanding JSON and data types is foundational for all advanced N8N work. Master strings, numbers, booleans, arrays, objects, and how to work with each.

## Module Information
- **Phase**: Phase 2 - Fundamentals
- **Duration**: 14 minutes
- **Complexity**: ⭐⭐⭐ Intermediate (CRITICAL)
- **Workflows Built**: 1 (data types practice)
- **Prerequisites**: Module 04 (Core Concepts)

## Learning Objectives

- Understand all N8N data types
- Differentiate between strings, numbers, and booleans
- Work with arrays and objects
- Access specific elements in arrays (zero-indexing)
- Access nested object properties
- Combine data types in expressions

## Core Concepts

### Data Types Available

**1. String** (text)
- Any text including numbers as text
- Can include special characters
- **JSON**: Has double quotes `"value"`
- **Icon**: T (text)
- Examples: `"Trent Reznor"`, `"12345"`

**2. Number**
- Only numeric values
- Cannot include text
- **JSON**: NO quotes `123`
- **Icon**: # (number)
- Errors if non-numeric input
- Examples: `999`, `0`, `150`

**3. Boolean**
- Only two values: `true` or `false`
- **JSON**: No quotes
- **Icon**: Checkbox
- Used for conditional logic

**4. Array**
- List of multiple items
- Can mix data types
- **JSON**: Square brackets `[item1, item2]`
- **Icon**: Three lines
- **Zero-indexed**: First item = 0
- Examples: `["rock", "metal"]`, `[1, 2, 3]`, `["text", 123, true]`

**5. Object**
- Key-value pairs (like a dictionary)
- Can nest objects
- **JSON**: Curly braces `{key: "value"}`
- **Icon**: Cube
- Access with dot notation: `object.key`

**6. Binary Data**
- Files (images, PDFs, etc.)
- Covered in Module 10

### Schema View Icons

| Type | Icon | JSON Format |
|------|------|-------------|
| String | T | `"value"` |
| Number | # | `123` |
| Boolean | Checkbox | `true` / `false` |
| Array | Three lines | `[items]` |
| Object | Cube | `{key: value}` |

### Accessing Data

**Arrays** (zero-indexed):
```
array[0]  // First item
array[1]  // Second item  
array[n-1] // Last item (length minus one)
```

**Objects** (dot notation):
```
object.property
object.nested.property
```

**Example**:
```json
{
  "album": {
    "title": "The Downward Spiral",
    "year": 1994
  }
}
```
Access: `{{$json.album.title}}` → "The Downward Spiral"

### Combining Data

**Strings** (concatenation):
```
{{$json.firstName}} {{$json.lastName}}
```
Result: "Trent Reznor"

**Numbers** (math):
```  
{{$json.price + $json.tax}}
```
Result: 150 (if price=100, tax=50)

**Special Functions**:
- `{{$now}}` - Current timestamp
- `{{$today}}` - Today's date
- Mathematical operations: `+`, `-`, `*`, `/`

## Key Takeaways

- ⚠️ **CRITICAL**: Understanding JSON is essential for 90% of N8N work
- 🎯 Strings have quotes in JSON, numbers don't
- 🎯 Arrays use square brackets `[]`, objects use curly braces `{}`
- 🎯 **Arrays are zero-indexed** - first item is `[0]`
- 💡 Schema view shows data types with icons
- 💡 Use expressions `{{}}` to access data dynamically

## Common Mistakes

| Mistake | Problem | Solution |
|---------|---------|----------|
| Text in number field | Returns `null` | Use string type |
| Accessing array[1] expecting first item | Gets second item | Use array[0] for first |
| Missing quotes in strings | JSON syntax error | Always quote strings |
| Wrong bracket type | Parsing fails | `[]` for arrays, `{}` for objects |

## Assignment

**Exercise**: Practice data types
1. Create Edit Fields node
2. Build advanced array with 5 elements (mix types)
3. Create object with nested properties
4. Use second Edit Fields to extract specific values
5. Combine strings and numbers in expressions

## Practical Applications

Understanding data types enables:
- API response parsing  
- Data transformation  
- Conditional logic
- Database operations
- Custom calculations

---

**Module Status**: ✅ Completed  
**Date Completed**: 2026-01-14  
**Workflows Built**: 1  
**Next Module**: [Module 08: N8N Nodes (Basic)](../08-basic-nodes/notes.md)
