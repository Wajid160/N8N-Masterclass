# Module 02: Self Hosted vs Cloud

## Overview
Understanding the fundamental differences between N8N Cloud and self-hosted deployments, including cost analysis, setup requirements, control options, and making the right choice for your needs.

## Module Information
- **Phase**: Phase 1 - Foundation
- **Duration**: 37 minutes
- **Complexity**: ⭐ Beginner-Intermediate
- **Workflows Built**: None (Setup/Configuration)
- **Prerequisites**: Module 01

## Learning Objectives

After completing this module, you will be able to:
- Compare cloud vs self-hosted N8N deployments
- Understand pricing models for both options
- Choose the right deployment method for your needs
- Set up your N8N environment (cloud, Docker, or VPS)
- Navigate N8N pricing tiers and limitations

## Core Concepts

### Concept 1: N8N Cloud

**What it is:**
Cloud N8N (n8n.io) is a managed service where N8N handles hosting, maintenance, and infrastructure.

**Pricing model:**
- Based on workflow executions
- Starter: $20-24/month (2,500 executions)
- Pro: $65+/month (starts at 10k executions)
- Business: $800-960/month (self-hosted with license)
- Enterprise: Custom pricing

**Key points:**
- 14-day free trial available
- 99% uptime guaranteed
- Automatic updates (2 clicks)
- Limited community nodes (must be approved)
- Data stored on N8N servers
- 1-day workflow history on starter (vs 5 days on Pro)

**When to use:**
- Want quick start and convenience
- Don't want to manage infrastructure
- Need reliable uptime
- Value time over money
- Most users choose this option

### Concept 2: Self-Hosted N8N

**What it is:**
Running N8N on your own infrastructure (computer, VPS, or cloud server). Free community edition available on GitHub.

**Cost structure:**
- Community edition: Free
- Business license: starts at $10,000/month (for larger companies)
- VPS hosting: ~$5/month (Hostinger)
- Docker on local machine: Free

**Key points:**
- YOU manage everything (updates, uptime, backups)
- Full control and more options
- All community nodes available immediately
- Data stays on your server
- More MCP (Model Context Protocol) options
- Requires technical management

**When to use:**
- Power users wanting full control
- Want to start free
- Data privacy requirements
- Need all community nodes
- Have technical skillsto manage infrastructure

**Common misconceptions:**
- Misconception 1: "Self-hosting is always cheaper" → Truth: Can be more expensive for businesses due to licensing ($10k+/month) and staffing costs
- Misconception 2: "Self-hosted means completely free" → Truth: VPS costs money, and larger companies need business licenses

### Concept 3: Deployment Options

**Cloud Setup:**
1. Sign up at n8n.io
2. Start 14-day free trial
3. Choose starter plan ($20/month)
4. Start building immediately

**Self-Hosted Docker:**
1. Download Docker Desktop
2. Pull N8N image (100M+ downloads)
3. Run on localhost:5678 (or 5680 if 5678 has issues)
4. Set up owner account
5. Free activation key available

**Self-Hosted VPS (Hostinger):**
1. Choose VPS plan (~$5/month)
2. Use code "datascience" for 10% off
3. Select server location closest to you
4. Install N8N image (pre-configured)
5. Set up via H panel terminal

## Comparison Table

| Feature | Self-Hosted | Cloud |
|---------|-------------|-------|
| **Cost** | Free initially (then VPS ~$5/mo) | $20/mo minimum |
| **Setup** | You manage everything | Managed by N8N |
| **Control** | Full control | Limited |
| **Maintenance** | You handle updates | Auto-updates |
| **Data** | Stays on your server | Stored on N8N servers |
| **Community Nodes** | All available instantly | Limited (approval required) |
| **MCP Connections** | More advanced options | Limited (improving 2026) |
| **Uptime** | Your responsibility | 99% guaranteed |
| **Best For** | Power users, free start | Quick start, convenience |

## Key Takeaways

- 🎯 Cloud ($20/mo) = Convenience & managed infrastructure
- 🎯 Self-hosted (Free-$5/mo) = Control & full features
- 🎯 Business licenses for self-hosted can cost $10,000+/month for large companies
- ⚠️ Course taught using N8N Cloud, but 95% applies to self-hosted
- 💡 Starter plan (2,500 executions) goes far for most beginners

## Pricing Insights

### Cloud Starter ($20-24/month)
-2,500 workflow executions
- 1 admin
- 1-day workflow history
- NO global variables
- 50 workflow builder credits
- Perfect for starting out

### Cloud Pro ($65+/month)
- 10,000+ executions (scalable to 50k)
- Multiple admins
- 5-day workflow history
- Variables & workflow history
- 1,000 workflow builder credits
- 20 concurrent executions

### When to Upgrade
- Exceeding 2,500 executions/month
- Need longer workflow history
- Require multiple team members
- Want advanced debugging features

## Setup Paths

### Recommended Path
**For beginners:** Start with N8N Cloud 14-day trial
- Fastest to start
- No maintenance
- Focus on learning, not infrastructure

**For power users:** Self-hosted Docker locally
- Free to experiment
- Full control
- Learn infrastructure management

**For production:** VPS (Hostinger ~$5/mo)
- Always accessible
- More reliable than local machine
- Still affordable

## Practical Applications

1. **Solo Entrepreneur**: Start with cloud starter, upgrade to Pro if needed
2. **Small Team (< 5 people)**: Cloud Pro or self-hosted VPS
3. **Large Company**: Business/Enterprise with dedicated infrastructure team
4. **Learning/Experimenting**: Docker locally (free) or cloud trial

## Common Pitfalls

| Pitfall | Solution |
|---------|----------|
| Choosing self-hosted without technical skills | Start with cloud for simplicity |
| Not accounting for business license costs | Factor in $10k/mo if company has revenue |
| Running out of executions on starter | Monitor usage, upgrade to Pro when needed |
| Forgetting to update self-hosted instance | Set reminders for updates (security) |

## Related Modules

**Build on this:**
- [Module 03: N8N Interface Tour](../03-interface-tour/notes.md) - Navigate the platform
- [Module 04: Core Concepts](../04-core-concepts/notes.md) - Fundamental workflow concepts

## Additional Resources

- [N8N Pricing Page](https://n8n.io/pricing)
- [N8N Community Edition (GitHub)](https://github.com/n8n-io/n8n)
- [Docker Desktop Download](https://www.docker.com/products/docker-desktop)
- [Hostinger VPS](https://www.hostinger.com) - Use code "datascience" for 10% off
- [N8N Documentation - Self-Hosting](https://docs.n8n.io/hosting/)

## Personal Notes

### Key Learnings
- Course uses Cloud, but concepts apply to both
- 95% of users likely use cloud vs self-hosted
- Self-hosting isn't always cheaper (business licenses expensive)
- Starter plan 2,500 executions is generous for learning

### Decision Made
**My Choice**: [Cloud Trial / Self-Hosted Docker / VPS]  
**Reasoning**: [Your reasoning here]

### Setup Completed
- [ ] N8N Cloud account created
- [  ] Docker installed and N8N running
- [ ] VPS set up with N8N
- [ ] Free activation key claimed

---

**Module Status**: ✅ Completed  
**Date Completed**: 2026-01-14  
**Time Spent**: 37 minutes  
**Next Module**: [Module 03: N8N Interface Tour](../03-interface-tour/notes.md)
