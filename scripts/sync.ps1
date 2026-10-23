# Universal AI-OS — Native Tool Sync Engine (PowerShell)
# Projects .ai/ commands and skills into native IDE discovery paths (.claude, .cursor, .agents)

$ErrorActionPreference = "Stop"

$root = Resolve-Path "."
$aiCommandsDir = Join-Path $root ".ai\commands"
$aiSkillsDir = Join-Path $root ".ai\skills"

if (-not (Test-Path $aiCommandsDir)) {
    Write-Error "Cannot find .ai/commands directory. Run this script from the repository root."
    exit 1
}

Write-Host "Synchronizing Universal AI-OS to native tool discovery folders..." -ForegroundColor Cyan

# 1. Setup target adapter directories
$claudeCmdDir = Join-Path $root ".claude\commands"
$cursorCmdDir = Join-Path $root ".cursor\commands"
$cursorRulesDir = Join-Path $root ".cursor\rules"
$agentsSkillsDir = Join-Path $root ".agents\skills"

New-Item -ItemType Directory -Path $claudeCmdDir -Force | Out-Null
New-Item -ItemType Directory -Path $cursorCmdDir -Force | Out-Null
New-Item -ItemType Directory -Path $cursorRulesDir -Force | Out-Null
New-Item -ItemType Directory -Path $agentsSkillsDir -Force | Out-Null

# Command metadata table
$commandMeta = @{
    "feature.md" = "Drive a feature request through requirements, impact analysis, implementation, testing, and completion"
    "refactor.md" = "Drive a refactor through analysis, invariants, strategy, risk analysis, incremental refactoring, and testing"
    "review.md" = "Review a diff/PR/change for correctness, requirements coverage, code quality, security, and performance"
    "knowledge-review.md" = "Review the current session and classify discoveries into knowledge, rule, skill, or ignore"
}

# 2. Project commands to .claude/commands and .cursor/commands
$commands = Get-ChildItem -Path $aiCommandsDir -Filter "*.md" | Where-Object { $_.Name -ne "README.md" }
foreach ($cmd in $commands) {
    $desc = if ($commandMeta.ContainsKey($cmd.Name)) { $commandMeta[$cmd.Name] } else { "Execute " + $cmd.BaseName + " workflow" }
    
    $stubLines = @(
        "---",
        "description: $desc",
        "---",
        "",
        ("Follow the canonical instructions in [`.ai/commands/{0}`](../../.ai/commands/{0})." -f $cmd.Name)
    )
    $stubContent = [string]::Join("`r`n", $stubLines)

    Set-Content -Path (Join-Path $claudeCmdDir $cmd.Name) -Value $stubContent -Encoding UTF8
    Set-Content -Path (Join-Path $cursorCmdDir $cmd.Name) -Value $stubContent -Encoding UTF8
    Write-Host ("  [OK] Linked command: /{0} -> .claude and .cursor" -f $cmd.BaseName) -ForegroundColor Green
}

# 3. Setup Cursor rule pointer
$cursorLines = @(
    "---",
    "description: Master pointer to Universal AI Operating System (.context and .ai)",
    "alwaysApply: true",
    "---",
    "",
    "For all project rules, coding standards, and architectural constraints, read AGENTS.md and .ai/README.md.",
    "Always check and update STATE.md for sprint handover."
)
$cursorRuleStub = [string]::Join("`r`n", $cursorLines)
Set-Content -Path (Join-Path $cursorRulesDir "ai-source-of-truth.mdc") -Value $cursorRuleStub -Encoding UTF8

# 4. Project skills to .agents/skills/ for Antigravity & Agent tools
$skillDirs = Get-ChildItem -Path $aiSkillsDir -Directory
foreach ($sd in $skillDirs) {
    $targetSkillDir = Join-Path $agentsSkillsDir $sd.Name
    New-Item -ItemType Directory -Path $targetSkillDir -Force | Out-Null
    
    $skillLines = @(
        "---",
        ("name: {0}" -f $sd.Name),
        ("description: Canonical skill defined in .ai/skills/{0}" -f $sd.Name),
        "---",
        "",
        ("Follow the canonical instructions in [`.ai/skills/{0}/SKILL.md`](../../../.ai/skills/{0}/SKILL.md)." -f $sd.Name)
    )
    $skillStub = [string]::Join("`r`n", $skillLines)
    Set-Content -Path (Join-Path $targetSkillDir "SKILL.md") -Value $skillStub -Encoding UTF8
    Write-Host ("  [OK] Linked skill: {0} -> .agents/skills" -f $sd.Name) -ForegroundColor Green
}

Write-Host ""
Write-Host "Tool synchronization complete! Native autocomplete is now active for:" -ForegroundColor Green
Write-Host "   - Claude Code CLI (/feature, /refactor, /review, /knowledge-review)" -ForegroundColor White
Write-Host "   - Cursor (/feature, /refactor, /review, /knowledge-review)" -ForegroundColor White
Write-Host "   - Antigravity and Agent runners (skills discovery in .agents/skills)" -ForegroundColor White
