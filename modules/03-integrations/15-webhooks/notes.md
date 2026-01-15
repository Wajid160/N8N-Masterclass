# Module 15: Webhooks

## Overview
Transform N8N workflows into API endpoints that receive data from external services. The inverse of HTTP Request - instead of N8N calling APIs, external services call N8N.

## Module Information
- **Phase**: Phase 3 - Integrations
- **Duration**: 24 minutes
- **Complexity**: ⭐⭐⭐⭐ Intermediate-Advanced
- **Workflows Built**: 2-3 webhook examples
- **Prerequisites**: Module 13 (HTTP Request)

## Learning Objectives

- Understand webhooks vs HTTP requests
- Set up webhook triggers in N8N
- Distinguish test vs production URLs
- Implement webhook security (authentication)
- Respond to webhook requests
- Integrate with real services (TypeForm, etc.)

## Core Concepts

### What Are Webhooks?

**HTTP Request** (Module 13): N8N → External API
```
N8N makes request → External service responds
```

**Webhook** (This module): External API → N8N
```
External service makes request → N8N workflow starts
```

**Real-World Example**:
- User submits form on your website
- Form service (TypeForm) sends data to N8N webhook
- N8N workflow processes submission
- N8N responds back to form service

### Webhook vs Native Triggers

**Native Triggers** (Preferred when available):
- Google Sheets trigger (on row added/updated)
- HubSpot trigger (on contact created)
- Gmail trigger (on message received)
- Pre-configured, easier to use

**Custom Webhooks** (When native unavailable):
- TypeForm submissions
- Custom applications
- Services without N8N integration
- Complete flexibility

## Webhook Node Basics

### Test URL vs Production URL

**Test URL**:
```
https://your-instance.app.n8n.cloud/webhook-test/unique-path
```
- Used while building workflow (inactive state)
- Listen for test events button
- Manual testing only
- Not publicly accessible

**Production URL**:
```
https://your-instance.app.n8n.cloud/webhook/unique-path
```
- Used when workflow is ACTIVE
- Publicly accessible on internet
- Anyone with URL can trigger (without auth!)
- **CRITICAL**: Secure with authentication

### Security Warning ⚠️

**WITHOUT Authentication**:
- Production URL is **publicly accessible**
- Anyone worldwide can trigger your workflow
- Can drain AI tokens, API credits
- Can access/modify sensitive data

**Solution**: Always use authentication on production webhooks!

## Webhook Configuration

### HTTP Methods

**POST** (Most common):
- Creating data
- Form submissions
- Data ingestion
- ~95% of webhook use cases

**GET**:
- Retrieving data
- Read-only operations
- Less common for webhooks

**DELETE, PUT, PATCH**:
- Rarely used for webhooks
- Specific use cases only

### Path Customization

**Default**: `/webhook/random-string`

**Custom**: Change to meaningful path
```
/webhook/typeform-submissions
/webhook/stripe-payments
/webhook/customer-signups
```

**Why**: Makes URLs more readable and organized

## Authentication Methods

### 1. Basic Auth (Username + Password)

**Setup**:
```
Authentication: Basic Auth
Credential: Create new
  - Username: jam
  - Password: strings
```

**Testing in Postman**:
```
Authorization tab
  → Type: Basic Auth
  → Username: jam
  → Password: strings
```

**Use Case**: Simple, widely supported

### 2. Header Auth (API Key)

**Setup**:
```
Authentication: Header Auth
Credential: Create new
  - Header Name: N8N-API
  - Header Value: key123
```

**Testing in Postman**:
```
Authorization tab
  → Type: API Key
  → Key: N8N-API
  → Value: key123
  → Add to: Header
```

**Use Case**: Modern approach, like API keys

### 3. JWT Auth

**Advanced**: Token-based authentication
**Use Case**: Enterprise integrations

## Respond to Webhook Node

### When to Use

**Immediate Response** (default):
Webhook automatically responds with status 200

**Custom Response** (use Respond to Webhook node):
- Service requires specific response format
- Need to return custom data
- Challenge tokens (Monday.com example)

### Example: Challenge Token Pattern

```
Webhook Trigger
  ↓
IF (contains challenge_token?)
  ├→ TRUE:
     • Respond to Webhook (return token)
     • Validates webhook setup
  └→ FALSE:
     • Process normal webhook data
     • Continue workflow
```

## Practical Workflows

### Workflow 1: TypeForm Integration

**Setup**:
1. Create TypeForm form (name, email, phone, company)
2. TypeForm → Connect → Webhooks
3. Add webhook URL from N8N
4. TypeForm sends POST requests with form data

**N8N Workflow**:
```
Webhook Trigger (POST)
  ↓
Extract form fields:
  - answers.first_name
  - answers.last_name
  - answers.email
  - answers.phone
  ↓
Process data (your logic)
  ↓
Store in Google Sheets / Send email / Update CRM
```

**Testing**:
1. Listen for test events in N8N
2. Send test request from TypeForm
3. View webhook data in N8N
4. Build processing logic

### Workflow 2: Postman Testing

**Why Postman**: Test webhooks without external service

**Setup**:
```
1. Create free Postman account
2. New Request → POST
3. URL: N8N test webhook URL
4. Body → Query Params:
   - band: northlane
   - jam_band: widespread_panic
5. Send → Data appears in N8N
```

**With Authentication**:
```
Authorization tab
  → Select type (Basic or API Key)
  → Enter credentials
  → Send request
```

### Workflow 3: Form to CRM

**Real-World Pattern**:
```
Website Form Submission
  ↓
Webhook Trigger
  ↓
Validate data (IF node)
  ↓
Check for duplicates (CRM API)
  ↓
IF (new contact?)
  ├→ TRUE:
     • Create in CRM
     • Send welcome email
     • Add to nurture sequence
  └→ FALSE:
     • Update

 existing contact
     • Log activity
```

## Common Patterns

### Pattern 1: Form Processing
```
Form Service (TypeForm, Google Forms)
  → Webhook → N8N
  → Validate data
  → Store in database
  → Send confirmation email
```

### Pattern 2: Payment Notifications
```
Stripe Payment Event
  → Webhook → N8N
  → Verify payment
  → Update order status
  → Send receipt
  → Trigger fulfillment
```

### Pattern 3: GitHub Events
```
GitHub Push Event
  → Webhook → N8N
  → Parse commit data
  → Run tests
  → Deploy if tests pass
  → Notify team
```

## Testing Webhooks

### Development Workflow

1. **Build with Test URL**:
   - Use "Listen for test event"
   - Workflow stays inactive
   - Safe for development

2. **Test with Postman**:
   - Send sample requests
   - Verify data structure
   - Test authentication

3. **Activate & Switch to Production**:
   - Activate workflow
   - Update external service with production URL
   - Enable authentication

### Debugging Tips

**No data received?**
- Check HTTP method matches (POST vs GET)
- Verify URL correct (test vs production)
- Check if workflow is active (for production URL)
- Test without auth first, add auth later

**Authentication errors?**
- Verify credentials match exactly
- Check header names/values
- Test in Postman first

**Wrong data structure?**
- Send test request from service
- Inspect received JSON
- Adjust data extraction accordingly

## Key Takeaways

- 🎯 Webhooks = **Receiving** requests (inverse of HTTP Request)
- 🎯 **Test URL** = Development, **Production URL** = Live
- 🎯 **ALWAYS** authenticate production webhooks
- 🎯 POST is default method for most webhooks
- 💡 Test with Postman before connecting real service
- 💡 Native triggers preferred when available
- ⚠️ Production URLs are publicly accessible without auth
- ⚠️ Don't forget to switch test → production URL when activating

## Common Use Cases

| Service | Webhook Use | Pattern |
|---------|-------------|---------|
| TypeForm | Form submissions | Webhook → Process → Store |
| Stripe | Payment events | Webhook → Verify → Update |
| GitHub | Code pushes | Webhook → Test → Deploy |
| Shopify | New orders | Webhook → Process → Fulfill |
| Custom App | Any event | Webhook → Your logic |

## Security Best Practices

1. **Always Authenticate Production**
   - Header Auth (modern)
   - Basic Auth (simple)
   - JWT (enterprise)

2. **Validate Incoming Data**
   - Check required fields exist
   - Validate data types
   - Sanitize inputs

3. **IP Whitelisting** (optional)
   - Restrict to known IPs
   - Additional security layer

4. **Rate Limiting** (advanced)
   - Prevent abuse
   - Protect resources

## Related Modules

**Prerequisites**:
- [Module 13: HTTP Request](../13-http-request/notes.md) - Understanding HTTP methods

**Complements**:
- [Module 14: API Workflows](../14-api-workflows/notes.md) - Complete API patterns
- [Module 19: Error Handling](../../04-ai-workflows/19-error-handling/notes.md) - Production reliability

## Additional Resources

- [N8N Webhook Documentation](https://docs.n8n.io/integrations/builtin/core-nodes/n8n-nodes-base.webhook/)
- [Postman](https://www.postman.com) - API testing tool
- [TypeForm Webhooks](https://www.typeform.com/help/webhooks/)
- [Webhook Security Guide](https://docs.n8n.io/hosting/security/)

---

**Module Status**: ✅ Completed  
**Date Completed**: 2026-01-15  
**Time Spent**: 24 minutes  
**Security Level**: CRITICAL  
**Next Module**: [Module 16: Web Scraping](../16-web-scraping/notes.md)
