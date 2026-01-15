# Module 16: Web Scraping

## Overview
Extract data from websites using N8N's HTML node, Apify integration, and SerpAPI. Automate data collection for price monitoring, competitor analysis, and lead generation.

## Module Information
- **Phase**: Phase 3 - Integrations
- **Duration**: 37 minutes
- **Complexity**: ⭐⭐⭐⭐ Advanced
- **Workflows Built**: 3+ scraping examples
- **Prerequisites**: Module 13 (HTTP Request), Module 14 (API Workflows)

## Learning Objectives

- Extract data from HTML using CSS selectors
- Use Apify for advanced scraping
- Scrape Google results with SerpAPI
- Understand ethical scraping practices
- Handle rate limiting and anti-scraping measures
- Build production-ready scrapers

## Core Concepts

### What is Web Scraping?

**Purpose**: Extract structured data from websites

**Common Use Cases**:
- **Price Monitoring**: Track competitor pricing
- **Lead Generation**: Extract contact information
- **Content Aggregation**: Collect articles, reviews
- **Market Research**: Monitor trends, sentiment
- **Data Migration**: Move data between platforms

### Scraping Methods in N8N

**1. HTML Node** (Simple scraping):
- Built-in N8N node
- CSS selectors or XPath
- Best for: Simple, static websites
- Free, no external services

**2. Apify Integration** (Advanced):
- Cloud scraping platform
- Pre-built scrapers (Amazon, LinkedIn, etc.)
- Handles JavaScript, pagination
- Best for: Complex websites, scale
- Paid service (free tier available)

**3. SerpAPI** (Google Results):
- Google search result scraping
- No Google blocking
- Structured data returned
- Best for: SEO, research
- Paid API

## Method 1: HTML Node

### HTML Node Basics

**How It Works**:
```
HTTP Request (get webpage HTML)
  ↓
HTML Node (extract data)
  ↓
Structured data output
```

### CSS Selectors

**Basic Selectors**:
```css
.class-name          /* Class selector */
#id-name             /* ID selector */
tag                  /* Element selector */
[attribute]          /* Attribute selector */
```

**Advanced Selectors**:
```css
.parent .child       /* Descendant */
.parent > .child     /* Direct child */
a[href*="example"]   /* Contains */
div:nth-child(2)     /* Nth element */
```

### Example: Scraping Product Prices

**Pattern**:
```
HTTP Request: GET https://example-store.com/products
  ↓
HTML Node:
  - Selector: .product-price
  - Extract: text
  - Result: ["$29.99", "$49.99", "$19.99"]
```

**Processing**:
```
Split Out (array to items)
  ↓
Edit Fields (clean price format)
  ↓
Filter (price > $25)
  ↓
Store in Google Sheets
```

### XPath Alternative

**When to Use**: More complex selections

**Example**:
```xpath
//div[@class='product']//span[@class='price']/text()
```

## Method 2: Apify Integration

### What is Apify?

**Cloud Scraping Platform**:
- Pre-built scrapers for popular sites
- Handles anti-scraping measures
- Runs on cloud infrastructure
- Returns clean, structured data

### Popular Apify Scrapers

**Amazon Scraper**:
- Product details, prices, reviews
- Search results
- Category pages

**LinkedIn Scraper**:
- Profile data
- Company information
- Job postings

**Google Maps Scraper**:
- Business listings
- Reviews, ratings
- Contact information

**Instagram/Twitter Scrapers**:
- Posts, comments
- Account data
- Engagement metrics

### Using Apify in N8N

**Setup**:
1. Create Apify account
2. Get API token
3. Add Apify credential in N8N
4. Select scraper (actor)
5. Configure inputs
6. Run and process results

**Pattern**:
```
Schedule Trigger (daily)
  ↓
Apify: Amazon Product Scraper
  - Input: Product URL or search term
  - Max items: 100
  ↓
Process results
  ↓
Store/Compare prices
```

## Method 3: SerpAPI

### Google Search Scraping

**Problem**: Google blocks scrapers

**Solution**: SerpAPI handles it for you

**What You Get**:
- Organic search results
- Featured snippets
- People also ask
- Related searches
- Ads data
- Knowledge graph

### SerpAPI Use Cases

**SEO Monitoring**:
```
Schedule: Daily
  ↓
SerpAPI: Search "your keyword"
  ↓
Extract ranking positions
  ↓
Compare to yesterday
  ↓
Alert if rank changed
```

**Competitor Analysis**:
```
SerpAPI: Search "competitor brand"
  ↓
Extract topics they rank for
  ↓
Identify content gaps
  ↓
Generate content ideas
```

**Lead Generation**:
```
SerpAPI: "plumber in [city]"
  ↓
Extract business listings
  ↓
Get contact information
  ↓
Add to CRM
```

## Ethical Scraping Practices

### Legal Considerations

**✅ Generally OK**:
- Public data (visible without login)
- Reasonable request rates
- Respecting robots.txt
- Personal/research use

**⚠️ Problematic**:
- Data behind login
- Overwhelming servers
- Ignoring Terms of Service
- Commercial use of copyrighted content

**❌ Never**:
- Personal information (GDPR/CCPA)
- Password-protected content
- Bypassing CAPTCHAs aggressively

### robots.txt File

**Check First**: `https://example.com/robots.txt`

**Example**:
```
User-agent: *
Disallow: /admin/
Disallow: /private/
Allow: /public/
```

**Respect**: These site rules

### Rate Limiting

**Why**: Avoid overwhelming servers

**Best Practices**:
```
Loop: For each URL
  → HTTP Request (scrape page)
  → Wait Node (2-5 seconds)
  → Next URL
```

**Be Kind**: 
- 1-5 second delays between requests
- Scrape during off-peak hours
- Use caching when possible

## Practical Workflows

### Workflow 1: Price Monitoring

**Goal**: Track competitor prices daily

```
Schedule Trigger (daily 9 AM)
  ↓
HTTP Request: Competitor product pages (loop)
  ↓
HTML Node: Extract .price class
  ↓
Edit Fields: Clean price format
  ↓
Google Sheets: Compare to yesterday
  ↓
IF (price changed)
  ├→ TRUE: Send Slack alert
  └→ FALSE: Do nothing
```

### Workflow 2: Content Aggregation

**Goal**: Collect industry news daily

```
Schedule: Daily 6 AM
  ↓
HTTP Request: Industry blog RSS feeds
  ↓
HTML Node: Extract articles
  - Title: h2.post-title
  - Link: a.read-more
  - Date: time.published
  ↓
Filter: Published in last 24 hours
  ↓
Summarize with AI
  ↓
Email digest to team
```

### Workflow 3: Lead Generation

**Goal**: Find local businesses

```
SerpAPI: "restaurants in Miami"
  ↓
Extract local pack results
  - Business name
  - Address
  - Phone
  - Rating
  ↓
Filter: Rating > 4.0
  ↓
Enrich with additional data
  ↓
Add to CRM (HubSpot/Salesforce)
```

## Anti-Scraping Challenges

### Common Obstacles

**1. JavaScript Rendering**:
- **Problem**: Content loads via JS
- **Solution**: Use Apify (renders JS)

**2. CAPTCHAs**:
- **Problem**: Bot detection
- **Solution**: Apify handles, or use APIs

**3. IP Blocking**:
- **Problem**: Too many requests
- **Solution**: Rate limiting, proxies (Apify)

**4. Dynamic Selectors**:
- **Problem**: Class names change
- **Solution**: Use stable attributes (data-*)

### Detection Avoidance

**Headers**:
```
HTTP Request:
  Headers:
    - User-Agent: Mozilla/5.0 (real browser)
    - Accept: text/html
    - Accept-Language: en-US
```

**Behavior**:
- Random delays (2-10 seconds)
- Don't scrape entire site at once
- Rotate patterns

## Data Extraction Tips

### Finding Selectors

**Browser DevTools**:
1. Right-click element → Inspect
2. Find wrapping div/class
3. Test selector in console:
   ```javascript
   document.querySelector('.product-price')
   ```

**SelectorGadget** (Chrome extension):
- Click elements to select
- Generates CSS selector
- Very helpful for beginners

### Handling Multiple Items

**Pattern**:
```
HTML Node:
  - Selector: .product-item (multiple results)
  - Result: Array of items
  ↓
Split Out
  ↓
Process each individually
```

### Nested Data

**Extract in layers**:
```
HTML Node 1: Get product containers
  ↓
Loop each container:
  → HTML Node 2: Get price
  → HTML Node 3: Get title
  → HTML Node 4: Get image
  → Combine into object
```

## Key Takeaways

- 🎯 **HTML Node** = Simple scraping, free
- 🎯 **Apify** = Advanced scraping, handles complexity
- 🎯 **SerpAPI** = Google results without blocking
- 💡 Always respect robots.txt and rate limits
- 💡 Add delays between requests (2-5 sec)
- ⚠️ Check legal/ToS before scraping
- ⚠️ JavaScript sites need Apify or headless browser

## Common Mistakes

| Mistake | Problem | Solution |
|---------|---------|----------|
| No delays | IP ban | Add Wait nodes |
| Wrong selector | No data | Use DevTools to verify |
| Ignoring robots.txt | Legal issues | Check and respect |
| No error handling | Workflow fails | Add Error Trigger |
| Scraping login-protected | ToS violation | Use APIs instead |

## Tools Comparison

| Feature | HTML Node | Apify | SerpAPI |
|---------|-----------|-------|---------|
| **Cost** | Free | Paid (free tier) | Paid |
| **Complexity** | Simple | Medium websites | Google only |
| **JavaScript** | ❌ No | ✅ Yes | ✅ Yes |
| **Anti-scraping** | ❌ No | ✅ Handles | ✅ Handles |
| **Setup** | Easy | Medium | Easy |
| **Best For** | Static sites | Complex sites | SEO/Research |

## Related Modules

**Prerequisites**:
- [Module 13: HTTP Request](../13-http-request/notes.md)
- [Module 14: API Workflows](../14-api-workflows/notes.md) - Pagination patterns

**Used With**:
- [Module 17: AI Agents](../../04-ai-workflows/17-ai-agents/notes.md) - Process scraped content
- [Module 22: RAG](../../04-ai-workflows/22-rag-basics/notes.md) - Build knowledge from scraped data

## Additional Resources

- [CSS Selectors Reference](https://www.w3schools.com/cssref/css_selectors.asp)
- [XPath Tutorial](https://www.w3schools.com/xml/xpath_syntax.asp)
- [Apify Platform](https://apify.com)
- [SerpAPI Docs](https://serpapi.com/search-api)
- [SelectorGadget](https://selectorgadget.com)

---

**Module Status**: ✅ Completed  
**Date Completed**: 2026-01-15  
**Time Spent**: 37 minutes  
**Legal Note**: Always verify scraping is allowed  
**Next Module**: [Module 17: Deeper AI Agents](../../04-ai-workflows/17-ai-agents/notes.md) ⚠️ LONGEST (138 min)
