# Module 14: N8N API Workflows

## Overview
**CRITICAL 91-MINUTE MODULE** - The longest fundamental module covering advanced API patterns including pagination, error handling, rate limiting, and batch processing. Essential for professional N8N development.

## Module Information
- **Phase**: Phase 3 - Integrations
- **Duration**: 91 minutes (LONGEST)
- **Complexity**: ⭐⭐⭐⭐⭐ Advanced (CRITICAL)
- **Workflows Built**: 5+ advanced patterns
- **Prerequisites**: Module 13 (HTTP Request)

## Learning Objectives

- Master API pagination (handle 1000+ records)
- Implement retry logic and error handling
- Respect rate limits (avoid API bans)
- Process data in batches efficiently
- Handle different authentication types
- Build production-ready API workflows

## Core Advanced Patterns

### 1. Pagination - Handling Large Datasets

**Problem**: APIs limit responses to 50-100 items at a time

**Solution**: Loop through pages until all data retrieved

#### Pagination Types

**A. Offset/Limit Pagination**
```
Page 1: ?offset=0&limit=100
Page 2: ?offset=100&limit=100
Page 3: ?offset=200&limit=100
```

**B. Page Number Pagination**
```
Page 1: ?page=1&per_page=100
Page 2: ?page=2&per_page=100
```

**C. Cursor-Based Pagination**
```
Page 1: ?cursor=start
Page 2: ?cursor=eyJpZCI6MTAwfQ
(cursor value from previous response)
```

**D. Link Header Pagination**
```
Response headers include:
Link: <url?page=2>; rel="next"
```

#### Loop Pattern for Pagination

```
Set Variables:
  - page = 1
  - hasMoreData = true
  
Loop (while hasMoreData = true):
  → HTTP Request: ?page={{$json.page}}
  → IF (items returned > 0)
    ├→ TRUE: 
       • Split Out items
       • Increment page
       • Continue loop
    └→ FALSE:
       • Set hasMoreData = false
       • Exit loop
       
Aggregate all collected items
```

### 2. Rate Limiting

**Problem**: APIs limit requests (e.g., 100/minute)

**Solution**: Add delays between requests

**Pattern**:
```
Loop Over Items:
  → HTTP Request
  → Wait Node (delay 1 second)
  → Next item
```

**Advanced**: Track request count
```
Set Variable: requestCount = 0

Loop:
  → Increment requestCount
  → IF (requestCount >= 100)
    ├→ Wait 60 seconds
    └→ Reset requestCount to 0
  → HTTP Request
```

### 3. Error Handling & Retry Logic

**Pattern**: Try → Catch → Retry

```
Error Trigger Node
  ↓
IF (Error type = Timeout OR 500 Error)
  ├→ TRUE:
     • Wait 10 seconds
     • Retry request (max 3 times)
  └→ FALSE:
     • Log error
     • Send alert
     • Stop workflow
```

**Exponential Backoff**:
- Attempt 1: Fail → Wait 1s
- Attempt 2: Fail → Wait 2s
- Attempt 3: Fail → Wait 4s
- Attempt 4: Fail → Alert team

### 4. Batch Processing

**Problem**: Processing 10,000 items takes too long

**Solution**: Process in batches

```
Get all items (10,000)
  → Split into batches of 100
  → Loop over batches:
     • Process batch
     • Wait between batches
     • Save results
  → Combine all results
```

**Benefits**:
- Manageable memory usage
- Better error recovery
- Progress tracking

### 5. Authentication Patterns

**API Key Rotation**:
```
Set multiple API keys in array
  → Use different key for each request
  → Distribute load across keys
  → Bypass individual key rate limits
```

**Token Refresh**:
```
HTTP Request
  → IF (401 Unauthorized)
     • Get new token
     • Retry with new token
```

## Practical Workflows

### Workflow 1: Paginated Data Collection

**Scenario**: Fetch all 500 customers from API (50/page)

```
1. Set Variables:
   - page = 1
   - allCustomers = []
   - hasMore = true

2. Loop (while hasMore):
   → HTTP: GET /customers?page={{$json.page}}&limit=50
   → Store response items
   → IF (items.length < 50)
      • hasMore = false
   → ELSE
      • page += 1
   
3. Aggregate: Combine all pages
4. Process: 500 customers ready
```

### Workflow 2: Rate-Limited API Processing

**Scenario**: Process 1000 items, API allows 10/second

```
Split Out: 1000 items
  ↓
Loop Over Items:
  → HTTP Request (process item)
  → Wait 100ms (0.1s)
  → Next item
  
Total time: ~100 seconds (respects 10/sec limit)
```

### Workflow 3: Batch Upload

**Scenario**: Upload 5000 records to CRM

```
Get 5000 records
  ↓
Code: Split into batches of 100
  [batch1: 100], [batch2: 100]... [batch50: 100]
  ↓
Loop batches:
  → HTTP POST /bulk-create (100 at once)
  → Wait 2 seconds
  → Next batch
  
Result: 5000 records in 50 requests (vs 5000)
```

### Workflow 4: Multi-Source Data Aggregation

**Scenario**: Combine data from 3 APIs

```
Trigger
  ├→ HTTP: Get users from API 1
  ├→ HTTP: Get orders from API 2
  └→ HTTP: Get products from API 3
  
Merge: Combine all data
  ↓
Code: Join data (users + their orders + products)
  ↓
Result: Complete dataset
```

### Workflow 5: Resilient API Workflow

**Production pattern with all safeguards**:

```
Try:
  Set retry count = 0
  
  Loop (max 3 attempts):
    → HTTP Request
    → IF (Success)
       • Process data
       • Exit loop
    → IF (Error)
       • Increment retry
       • Wait (exponential backoff)
       • Continue if retry < 3
       
Catch (Error Trigger):
  → Log to Data Tables
  → Send Slack alert
  → Send email to dev team
```

## Advanced Techniques

### Dynamic URL Building

```javascript
// Code node
const baseUrl = "https://api.example.com";
const endpoint = "/users";
const params = {
  status: "active",
  limit: 100,
  offset: $json.offset
};

const url = `${baseUrl}${endpoint}?${new URLSearchParams(params)}`;
return { url };
```

### Response Parsing

```javascript
// Extract nested data
const items = $json.data.results.items;
const nextPage = $json.pagination.next_page;
const total = $json.meta.total_count;

return {
  items,
  nextPage,
  total
};
```

### Smart Retry Logic

```javascript
const maxRetries = 3;
const retryCount = $json.retryCount || 0;

if (retryCount < maxRetries) {
  const waitTime = Math.pow(2, retryCount) * 1000; // Exponential
  return {
    shouldRetry: true,
    waitTime,
    retryCount: retryCount + 1
  };
}

return { shouldRetry: false };
```

## Common API Challenges

| Challenge | Solution | Pattern |
|-----------|----------|---------|
| Large datasets | Pagination | Loop with page tracking |
| Rate limits | Delay requests | Wait node between calls |
| Timeouts | Retry logic | Error trigger + retry |
| Authentication expiry | Token refresh | Error catch + re-auth |
| Batch operations | Group items | Code node batching |
| Data transformation | Code node | JavaScript processing |

## Production Best Practices

### 1. Always Log Errors
```
Error Trigger
  → Data Tables: Insert error log
  → Include: timestamp, error message, input data
```

### 2. Implement Monitoring
```
Schedule: Every hour
  → Data Tables: Check error count
  → IF (errors > 10)
     • Send alert
```

### 3. Graceful Degradation
```
HTTP Request fails
  → Log error
  → Use cached data (if available)
  → Continue workflow (don't fail everything)
```

### 4. API Health Checks
```
Schedule: Every 5 minutes
  → HTTP: GET /health endpoint
  → IF (fails)
     • Alert team
     • Disable dependent workflows
```

## Key Takeaways

- 🎯 **Pagination is mandatory** for large datasets
- 🎯 **Rate limiting prevents API bans** - always implement delays
- 🎯 **Error handling = production ready** workflows
- 🎯 **Batch processing = efficiency** for bulk operations
- 💡 Exponential backoff for retries
- 💡 Log all errors for debugging
- ⚠️ Test with small datasets first
- ⚠️ Check API documentation for limits

## Common Mistakes

| Mistake | Problem | Solution |
|---------|---------|----------|
| No pagination | Only get first 100 items | Implement loop pattern |
| Ignore rate limits | API ban | Add Wait nodes |
| No error handling | Workflow fails silently | Add Error Trigger |
| Process all at once | Memory issues | Batch processing |
| Hardcode credentials | Security risk | Use Generic Credentials |

## Tools Used in This Module

- **Loop Over Items**: Iterate through data
- **Code Node**: Complex logic (JavaScript)
- **Wait Node**: Delay execution
- **Error Trigger**: Catch failures
- **IF Node**: Conditional logic
- **Merge Node**: Combine data streams
- **Aggregate/Summarize**: Collect results

## Related Modules

**Prerequisites**:
- [Module 13: HTTP Request](../13-http-request/notes.md) - HTTP basics
- [Module 08: Basic Nodes](../../02-fundamentals/08-basic-nodes/notes.md) - Loop, IF

**Builds to**:
- [Module 15: Webhooks](../15-webhooks/notes.md) - Receiving requests
- [Module 19: Error Handling](../../04-ai-workflows/19-error-handling/notes.md) - Advanced debugging
- [Module 23: Advanced N8N](../../05-advanced-techniques/23-advanced-n8n/notes.md) - Sub-workflows

## Additional Resources

- [API Pagination Patterns](https://nordicapis.com/everything-you-need-to-know-about-api-pagination/)
- [Rate Limiting Best Practices](https://cloud.google.com/architecture/rate-limiting-strategies-techniques)
- [HTTP Status Codes Reference](https://httpstatuses.com)
- [REST API Design Guide](https://restfulapi.net/)

---

**Module Status**: ✅ Completed  
**Date Completed**: 2026-01-15  
**Time Spent**: 91 minutes  
**Complexity**: ⭐⭐⭐⭐⭐ Advanced  
**Impact**: CRITICAL for professional workflows  
**Next Module**: [Module 15: Webhooks](../15-webhooks/notes.md)
