# N8N Best Practices - Expert Recommendations

> Lessons learned and professional patterns for production-ready workflows

---

## 🏗️ Workflow Design

### Keep It Simple
- ❌ Don't: Build overly complex mega-workflows
- ✅ Do: Break into smaller sub-workflows
- **Why**: Easier to debug, maintain, and reuse

### Document Everything
- Add sticky notes explaining complex logic
- Use descriptive node names
- Include workflow description at top
- **Template**: "What it does | When it runs | Owner"

### Plan Before Building
- Sketch data flow on paper first
- Identify required credentials
- List edge cases to handle
- **Tool**: Use implementation_plan template

---

## 📊 Data Handling

### JSON Best Practices
- Always validate JSON structure first
- Use `{{ $json }}` to reference current item
- Test with edge cases (null, empty, large datasets)
- **Pro Tip**: Pin sample data for testing

### Working with Arrays
- Use Split Out for item processing
- Batch large arrays for performance
- Consider memory limits (10,000+ items)
- **Pattern**: Split → Process → Aggregate

### Binary Files
- Check file size limits before processing
- Convert to base64 when needed
- Clean up temporary files
- **Gotcha**: Binary data doesn't merge like JSON

---

## 🔌 API Integration

### Authentication
- Store credentials centrally in N8N
- Never hardcode API keys in workflows
- Use environment variables for secrets
- **Rotation**: Update credentials before expiry

### Error Handling
- Always implement retry logic
- Set appropriate timeout values
- Log errors for debugging
- **Pattern**: Try → Catch → Notify

### Rate Limits
- Respect API rate limits
- Add delays between requests if needed
- Implement exponential backoff
- **Tool**: Wait node between batch calls

### Pagination
- Handle pagination for all list endpoints
- Test with datasets larger than page size
- Set max iterations to prevent infinite loops
- **Safety**: Always have a loop exit condition

---

## 🤖 AI Workflows

### Prompt Engineering
- Be specific and detailed in prompts
- Include examples in system messages
- Use structured output formats (JSON)
- **Template**: Role + Task + Context + Format

### Cost Optimization
- Use cheaper models for simple tasks
- Cache repeated AI calls
- Batch similar requests
- **Rule**: GPT-4 for complex, GPT-3.5 for simple

### Context Management
- Keep context windows reasonable (< 50% max)
- Summarize old conversations
- Clear irrelevant history
- **Monitor**: Token usage per execution

### Tool Calling
- Provide clear tool descriptions
- Validate tool outputs
- Handle tool failures gracefully
- **Testing**: Test each tool independently

---

## 🛡️ Error Handling

### Error Trigger Pattern
```
Main Workflow
   └─→ [Error Trigger Node]
        └─→ [Log Error]
        └─→ [Notify Admin]
        └─→ [Optional: Retry]
```

### Common Strategies
1. **Retry**: Attempt again after delay
2. **Fallback**: Use alternative approach
3. **Skip**: Continue with other items
4. **Notify**: Alert and manual intervention

### What to Log
- Error message and node name
- Input data that caused error
- Timestamp and workflow execution ID
- **Storage**: Send to Google Sheets or database

---

## 🚀 Performance

### Execution Speed
- Minimize HTTP requests
- Use batch operations
- Parallel process when possible
- **Benchmark**: Monitor execution times

### Memory Management
- Process large datasets in batches
- Clear unnecessary data between nodes
- **Limit**: Starter plan has execution limits

### Caching
- Cache API responses when applicable
- Store frequently accessed data
- Set appropriate TTL (Time To Live)
- **Pattern**: Check cache → Miss? → Call API → Store

---

## 🔒 Security

### Credentials
- Use OAuth over API keys when possible
- Rotate credentials regularly
- Limit credential access to needed users
- **Audit**: Review credential usage quarterly

### Data Privacy
- Don't log sensitive information
- Encrypt data at rest when possible
- Comply with GDPR/privacy regulations
- **Rule**: Minimal data retention

### Webhook Security
- Validate webhook signatures
- Use HTTPS only
- Implement rate limiting
- **Filter**: Whitelist expected sources

---

## 📝 Documentation

### Workflow Level
- Clear description of purpose
- List of required credentials
- Expected execution frequency
- **Tags**: Use tags for categorization

### Node Level
- Complex logic needs sticky notes
- Document why, not just what
- Link to external documentation
- **Naming**: Descriptive node names

### Project Level
- README with setup instructions
- Architecture diagrams
- Troubleshooting guide
- **Template**: Use workflow-documentation-template.md

---

## 🧪 Testing

### Before Production
- [ ] Test with real data
- [ ] Test error scenarios
- [ ] Test with max data volume
- [ ] Test all conditional branches
- [ ] Verify credential expiry handling

### Ongoing
- Monitor execution logs
- Track failure rates
- Review performance metrics
- **Alert**: Set up failure notifications

---

## 🔄 Maintenance

### Regular Tasks
- Review and update credentials
- Check for N8N updates
- Optimize slow workflows
- Archive unused workflows
- **Schedule**: Monthly review

### Version Control
- Export workflows regularly
- Use Git for tracking changes
- Document breaking changes
- **Backup**: Weekly exports to cloud storage

---

## 💼 Professional Patterns

### Naming Conventions
- Workflows: `[Purpose] - [Trigger]` (e.g., "Customer Onboarding - Webhook")
- Nodes: `[Action] [Object]` (e.g., "Get User Data")
- Credentials: `[Service] - [Owner/Project]`

### Folder Organization
- Group by business function
- Use tags for cross-cutting concerns
- Archive completed projects
- **Structure**: Project → Sub-workflows

### Client Delivery
- Provide setup documentation
- Include test data
- Offer training session
- **SLA**: Define support expectations

---

## ❌ Common Anti-Patterns

### Don't
- ❌ Hardcode values that change
- ❌ Build untestable mega-workflows
- ❌ Ignore error handling
- ❌ Skip documentation
- ❌ Process unlimited items without batching

### Do Instead
- ✅ Use variables/parameters
- ✅ Build modular sub-workflows
- ✅ Implement robust error handling
- ✅ Document as you build
- ✅ Batch large datasets

---

## 📚 Learning Resources

### Official
- [N8N Documentation](https://docs.n8n.io)
- [N8N Community Forum](https://community.n8n.io)
- [N8N YouTube Channel](https://www.youtube.com/c/n8n-io)

### Community
- N8N Discord server
- GitHub discussions
- Reddit r/n8n

---

**Remember**: The best workflow is one that works reliably, is easy to understand, and simple to maintain.

---

**[Back to References](README.md)** | **[Main README](../README.md)**
