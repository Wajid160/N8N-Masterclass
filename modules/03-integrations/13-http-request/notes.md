# Module 13: HTTP Request Node

## Overview
**Foundation for ALL API work** - Master the HTTP Request node to connect with any external service. This 20-minute module unlocks unlimited integration possibilities.

## Module Information
- **Phase**: Phase 3 - Integrations
- **Duration**: 20 minutes
- **Complexity**: ⭐⭐⭐⭐ Intermediate-Advanced (CRITICAL)
- **Workflows Built**: 4 API examples
- **Prerequisites**: Module 11 (Google Integration)

## Learning Objectives

- Master HTTP methods (GET, POST, PUT, DELETE)
- Work with query parameters and headers
- Handle authentication (API keys, OAuth, Bearer tokens)
- Download and process binary files via HTTP
- Debug API errors effectively
- Secure API credentials properly

## Core Concepts

### HTTP Methods

**GET** - Retrieve data
- Example: Fetch user profile, get weather data
- No body required
- Data passed via URL parameters

**POST** - Create new data
- Example: Create new record, submit form
- Requires body with data
- Returns created resource

**PUT** - Update existing data
- Example: Update user profile
- Requires ID + new data in body

**DELETE** - Remove data
- Example: Delete record
- Usually just needs ID

**PATCH** - Partial update
- Like PUT but only changes specified fields

### URL Structure

```
https://api.example.com/v1/users?status=active&limit=10
└─────┬────┘ └──┬──┘ └┬┘ └──┬───┘ └────────┬─────────┘
   Protocol   Domain  Path Version  Query Parameters
```

### Query Parameters

**Add with** `?` and separate with `&`:
```
?lat=40.71&lon=74.00&appid=YOUR_KEY
```

**In N8N**:
- Option 1: Add to URL directly
- Option 2: Use "Send Query Parameters" section (RECOMMENDED)

**Example**:
```
Send Query Parameters:
  - Name: lat | Value: 40.71
  - Name: lon | Value: 74.00
  - Name: appid | Value: {{$credentials.apiKey}}
```

### Authentication Methods

**1. API Key in Query**
```
?apikey=YOUR_KEY_HERE
```
**Security**: Use Generic Credential → Query Auth

**2. API Key in Header**
```
Header:  
  Name: X-API-Key
  Value: YOUR_KEY
```
**Security**: Use Generic Credential → Header Auth

**3. Bearer Token**
```
Header:
  Name: Authorization
  Value: Bearer YOUR_TOKEN
```
**Security**: Use predefined or Generic → Header Auth

**4. OAuth 2.0**
- Pre-configured for Google, GitHub, etc.
- N8N handles token refresh automatically

## Securing API Keys (CRITICAL)

### ❌ INSECURE - Never Do This:
```
URL: https://api.com/data?apikey=sk_live_8239847329847
```
**Problem**: Anyone who gets workflow JSON sees your key!

### ✅ SECURE - Always Do This:

**Step 1**: Check for predefined credential
- Authentication → Predefined
- Search for service name
- If exists: Use it!

**Step 2**: If not predefined, use Generic Credential
- Authentication → Generic Credential
- Type: Query Auth or Header Auth (check API docs)
- Create credential with API key
- Select credential in HTTP node

**Example - Query Auth**:
```
Generic Credential:
  - Name: "OpenWeather API"
  - Parameter Name: "appid" (from API docs)
  - Value: YOUR_API_KEY
```

Now your workflow JSON is safe to share!

## Working with Binary Files

### Download File from URL

**Set Response Format to "File"**:
```
HTTP Request:
  URL: https://example.com/image.jpg
  Response Format: File
  
Result: Binary data named "data"
```

**Use Case**: Download images, PDFs, documents

### Upload File to API

**Body Content Type**: `multipart/form-data`
```
HTTP Request:
  Method: POST
  Body: Binary File
  Binary Property: "data" (your file field name)
```

## Common Patterns

### Pattern 1: Public API (No Auth)
```
HTTP Request:
  Method: GET
  URL: https://api.restcountries.com/v3.1/all
  Query Parameters:
    - fields: name,currencies,cioc,fifa
```

### Pattern 2: API Key in Query
```
HTTP Request:
  Method: GET
  URL: https://api.openweathermap.org/data/2.5/weather
  Authentication: Generic Credential (Query Auth)
  Query Parameters:
    - lat: 40.71
    - lon: 74.00
```

### Pattern 3: Bearer Token
```
HTTP Request:
  Method: GET
  URL: https://api.service.com/v1/data
  Authentication: Generic Credential (Header Auth)
  Header Name: Authorization
  Header Value: Bearer {{$credentials.token}}
```

### Pattern 4: Download and Process Image
```
HTTP Request 1: Get image URL from API
  → Extract image URL from JSON
  
HTTP Request 2: Download image
  → URL: {{$json.image_url}}
  → Response Format: File
  
Result: Binary image ready to process/upload
```

## Debugging API Errors

### Common Error Codes

| Code | Meaning | Solution |
|------|---------|----------|
| 401 | Unauthorized | Check API key, might not be activated yet |
| 403 | Forbidden | API key valid but lacks permissions |
| 404 | Not Found | Check URL, endpoint might not exist |
| 429 | Too Many Requests | Rate limit hit, add delay |
| 500 | Server Error | API issue, try again later |

### API Key Activation Delays

**Example**: OpenWeather API
- Keys can take **2 hours** to activate
- Some services: overnight activation
- Check service documentation
- Use Stack Overflow for debugging

### Debugging Steps

1. **Check URL**: Copy/paste into browser
2. **Verify method**: GET vs POST?
3. **Check authentication**: Type correct?
4. **Review docs**: Required vs optional parameters?
5. **Google error code**: "[Service] error 401"
6. **Check Stack Overflow**: Others had same issue?

## Practical Examples

### Example 1: Countries API

**Get all countries with specific fields**:
```
URL: https://restcountries.com/v3.1/all
Query Params:
  - fields: name,currencies,cioc,fifa
  
Filter: English-speaking countries
Process: Extract specific data
```

### Example 2: Dog Images API

**Get random dog image**:
```
GET: https://dog.ceo/api/breeds/image/random
Result: JSON with image URL

HTTP Request 2:
URL: {{$json.message}}
Response Format: File
Result: Downloaded dog image
```

**Dynamic breed selection**:
```
Form: User enters breed (e.g., "retriever")
HTTP: https://dog.ceo/api/breed/{{$json.breed}}/images
Split Out: Array of images
Filter: Specific sub-breed
Download: Selected images
```

### Example 3: Weather API (with credentials)

**Setup**:
```
1. Sign up at openweathermap.org
2. Get API key (wait 2 hours for activation!)
3. Create Generic Credential:
   - Type: Query Auth
   - Name: appid
   - Value: YOUR_KEY
```

**Workflow**:
```
Google Sheets: Customer locations
  → HTTP: Get weather for each location
  → IF: Temperature < 50°F?
    ├→ TRUE: Gmail (promote jackets)
    └→ FALSE: Do nothing
```

## Key Takeaways

- 🎯 HTTP Request = Universal API connector
- 🎯 **NEVER** hardcode API keys in URL/params
- 🎯 Use Generic Credentials for security
- 🎯 Query params: Use "Send Query Parameters"
- 🎯 Binary files: Set Response Format = "File"
- 💡 Check predefined credentials first
- ⚠️ API keys can take hours to activate
- ⚠️401 error = Check activation status

## Related Modules

**Prerequisites**:
- [Module 11: Google Integration](../11-google-credentials/notes.md) - OAuth example

**Builds to**:
- [Module 14: API Workflows](../14-api-workflows/notes.md) - CRITICAL advanced patterns (91 min)
- [Module 15: Webhooks](../15-webhooks/notes.md) - Receiving HTTP requests

## Additional Resources

- [REST Countries API](https://restcountries.com) - Free, no auth
- [Dog CEO API](https://dog.ceo/dog-api/) - Free images
- [OpenWeather API](https://openweathermap.org/api) - Weather data
- [Public APIs List](https://github.com/public-apis/public-apis) - 1000+ free APIs
- [HTTP Status Codes](https://httpstatuses.com) - Error reference

---

**Module Status**: ✅ Completed  
**Date Completed**: 2026-01-15  
**Time Spent**: 20 minutes  
**APIs Tested**: 3  
**Next Module**: [Module 14: N8N API Workflows](../14-api-workflows/notes.md) ⚠️ LONGEST (91 min)
