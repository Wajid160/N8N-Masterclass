# N8N Masterclass Repository Setup Script
# This script creates the complete folder structure for the N8N Masterclass repository

# Set the base directory
$baseDir = "C:\Users\wajid\Desktop\N8N Course"

Write-Host "Creating N8N Masterclass Repository Structure..." -ForegroundColor Cyan
Write-Host "Base Directory: $baseDir" -ForegroundColor Yellow
Write-Host ""

# Create main directories
$mainDirs = @(
    "modules",
    "workflows",
    "resources\diagrams",
    "resources\screenshots",
    "resources\cheatsheets",
    "references",
    "templates",
    ".github"
)

foreach ($dir in $mainDirs) {
    $path = Join-Path $baseDir $dir
    if (!(Test-Path $path)) {
        New-Item -ItemType Directory -Path $path -Force | Out-Null
        Write-Host "✓ Created: $dir" -ForegroundColor Green
    } else {
        Write-Host "○ Exists: $dir" -ForegroundColor Gray
    }
}

Write-Host "`n--- Phase 1: Foundation ---" -ForegroundColor Cyan

# Phase 1: Foundation
$phase1 = @(
    "modules\01-foundation\01-intro-to-course",
    "modules\01-foundation\02-self-hosted-vs-cloud",
    "modules\01-foundation\03-interface-tour",
    "modules\01-foundation\04-core-concepts"
)

foreach ($dir in $phase1) {
    $path = Join-Path $baseDir $dir
    New-Item -ItemType Directory -Path $path -Force | Out-Null
    Write-Host "✓ Created: $dir" -ForegroundColor Green
}

Write-Host "`n--- Phase 2: Fundamentals ---" -ForegroundColor Cyan

# Phase 2: Fundamentals
$phase2 = @(
    "modules\02-fundamentals\05-common-triggers",
    "modules\02-fundamentals\06-ai-basics",
    "modules\02-fundamentals\07-json-basics",
    "modules\02-fundamentals\08-basic-nodes",
    "modules\02-fundamentals\09-data-tables",
    "modules\02-fundamentals\10-binary-files"
)

foreach ($dir in $phase2) {
    $path = Join-Path $baseDir $dir
    New-Item -ItemType Directory -Path $path -Force | Out-Null
    Write-Host "✓ Created: $dir" -ForegroundColor Green
}

Write-Host "`n--- Phase 3: Integrations ---" -ForegroundColor Cyan

# Phase 3: Integrations
$phase3 = @(
    "modules\03-integrations\11-google-credentials-nodes",
    "modules\03-integrations\12-workflow-documentation",
    "modules\03-integrations\13-http-request-node",
    "modules\03-integrations\14-api-workflows",
    "modules\03-integrations\15-webhooks",
    "modules\03-integrations\16-web-scraping"
)

foreach ($dir in $phase3) {
    $path = Join-Path $baseDir $dir
    New-Item -ItemType Directory -Path $path -Force | Out-Null
    Write-Host "✓ Created: $dir" -ForegroundColor Green
}

Write-Host "`n--- Phase 4: AI Workflows ---" -ForegroundColor Cyan

# Phase 4: AI Workflows
$phase4 = @(
    "modules\04-ai-workflows\17-deeper-ai-agents",
    "modules\04-ai-workflows\18-chathub",
    "modules\04-ai-workflows\19-error-handling-debugging",
    "modules\04-ai-workflows\20-advanced-ai-nodes",
    "modules\04-ai-workflows\21-image-video-ai",
    "modules\04-ai-workflows\22-rag-basics"
)

foreach ($dir in $phase4) {
    $path = Join-Path $baseDir $dir
    New-Item -ItemType Directory -Path $path -Force | Out-Null
    Write-Host "✓ Created: $dir" -ForegroundColor Green
}

Write-Host "`n--- Phase 5: Advanced Techniques ---" -ForegroundColor Cyan

# Phase 5: Advanced Techniques
$phase5 = @(
    "modules\05-advanced-techniques\23-advanced-n8n",
    "modules\05-advanced-techniques\24-human-in-loop",
    "modules\05-advanced-techniques\25-evaluations",
    "modules\05-advanced-techniques\26-building-faster"
)

foreach ($dir in $phase5) {
    $path = Join-Path $baseDir $dir
    New-Item -ItemType Directory -Path $path -Force | Out-Null
    Write-Host "✓ Created: $dir" -ForegroundColor Green
}

Write-Host "`n--- Phase 6: Production & Deployment ---" -ForegroundColor Cyan

# Phase 6: Production & Deployment
$phase6 = @(
    "modules\06-production-deployment\27-security-compliance",
    "modules\06-production-deployment\28-model-context-protocol",
    "modules\06-production-deployment\29-frontend-ui",
    "modules\06-production-deployment\30-upwork-freelancing",
    "modules\06-production-deployment\31-more-projects"
)

foreach ($dir in $phase6) {
    $path = Join-Path $baseDir $dir
    New-Item -ItemType Directory -Path $path -Force | Out-Null
    Write-Host "✓ Created: $dir" -ForegroundColor Green
}

Write-Host "`n--- Workflow Directories ---" -ForegroundColor Cyan

# Workflow directories
$workflowDirs = @(
    "workflows\basic-examples\first-workflow",
    "workflows\basic-examples\data-transformations",
    "workflows\google-integrations\sheets-automation",
    "workflows\google-integrations\gmail-automation",
    "workflows\google-integrations\drive-management",
    "workflows\api-workflows\basic-api-calls",
    "workflows\api-workflows\pagination-example",
    "workflows\api-workflows\error-handling-demo",
    "workflows\webhooks\webhook-receiver",
    "workflows\webhooks\webhook-responder",
    "workflows\web-scraping\basic-scraper",
    "workflows\web-scraping\apify-scraper",
    "workflows\ai-agents\basic-agent",
    "workflows\ai-agents\tool-calling-agent",
    "workflows\ai-agents\multi-agent-system",
    "workflows\chathub\chat-interface",
    "workflows\advanced-ai\custom-ai-tools",
    "workflows\advanced-ai\optimized-ai-pipeline",
    "workflows\image-video\image-generation",
    "workflows\rag\basic-rag-pipeline",
    "workflows\rag\advanced-rag-system",
    "workflows\templates\error-handling-template",
    "workflows\templates\pagination-template",
    "workflows\templates\approval-workflow-template",
    "workflows\projects"
)

foreach ($dir in $workflowDirs) {
    $path = Join-Path $baseDir $dir
    New-Item -ItemType Directory -Path $path -Force | Out-Null
    Write-Host "✓ Created: $dir" -ForegroundColor Green
}

Write-Host "`n--- Creating Placeholder README Files ---" -ForegroundColor Cyan

# Create placeholder README.md files in key directories
$readmeDirs = @(
    "workflows",
    "workflows\projects",
    "resources",
    "references",
    "templates"
)

foreach ($dir in $readmeDirs) {
    $readmePath = Join-Path $baseDir "$dir\README.md"
    if (!(Test-Path $readmePath)) {
        "# $dir`n`nDocumentation coming soon..." | Out-File -FilePath $readmePath -Encoding UTF8
        Write-Host "✓ Created README: $dir\README.md" -ForegroundColor Green
    }
}

Write-Host "`n============================================" -ForegroundColor Cyan
Write-Host "Repository Structure Created Successfully!" -ForegroundColor Green
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Next Steps:" -ForegroundColor Yellow
Write-Host "1. Navigate to: $baseDir" -ForegroundColor White
Write-Host "2. Initialize Git repository (if not already done)" -ForegroundColor White
Write-Host "3. Start populating module documentation as you progress" -ForegroundColor White
Write-Host "4. Add workflow JSON files to the workflows/ directory" -ForegroundColor White
Write-Host ""
Write-Host "Happy learning! 🚀" -ForegroundColor Cyan
