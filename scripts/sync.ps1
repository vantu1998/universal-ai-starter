# Universal AI-OS — Native Tool Sync Engine (PowerShell)
# Projects .ai/ commands and skills into native IDE discovery paths (.claude, .cursor, .agents)

$ErrorActionPreference = "Stop"

# Write UTF-8 (no BOM) with LF so output is byte-identical to sync.sh
function Write-Utf8($path, $content) {
    [IO.File]::WriteAllText($path, $content, (New-Object Text.UTF8Encoding($false)))
}

$root = (Resolve-Path ".").Path
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

# 2. Project commands to .claude/commands and .cursor/commands
$commands = Get-ChildItem -Path $aiCommandsDir -Filter "*.md" | Where-Object { $_.Name -ne "README.md" }
foreach ($cmd in $commands) {
    # Read description from the canonical command frontmatter
    $desc = "Execute " + $cmd.BaseName + " workflow"
    $dm = Select-String -Path $cmd.FullName -Pattern "^description:\s*(.+)$" | Select-Object -First 1
    if ($dm) { $desc = $dm.Matches[0].Groups[1].Value.Trim() }
    
    $stubLines = @(
        "---",
        "description: $desc",
        "---",
        "",
        ("Follow the canonical instructions in [``.ai/commands/{0}``](../../.ai/commands/{0})." -f $cmd.Name)
    )
    $stubContent = ([string]::Join("`n", $stubLines) + "`n")

    Write-Utf8 (Join-Path $claudeCmdDir $cmd.Name) $stubContent
    Write-Utf8 (Join-Path $cursorCmdDir $cmd.Name) $stubContent
    Write-Host ("  [OK] Linked command: /{0} -> .claude and .cursor" -f $cmd.BaseName) -ForegroundColor Green
}

# 3. Setup Cursor rule pointer
$cursorLines = @(
    "---",
    "description: Master pointer to Universal AI Operating System (.context & .ai)",
    "alwaysApply: true",
    "---",
    "",
    "For all project rules, coding standards, and architectural constraints, read ``AGENTS.md`` and ``.ai/README.md``.",
    "Always check and update ``STATE.md`` for sprint handover."
)
$cursorRuleStub = ([string]::Join("`n", $cursorLines) + "`n")
Write-Utf8 (Join-Path $cursorRulesDir "ai-source-of-truth.mdc") $cursorRuleStub

# 4. Project skills to .agents/skills/ for Antigravity & Agent tools
$skillDirs = Get-ChildItem -Path $aiSkillsDir -Directory
foreach ($sd in $skillDirs) {
    $targetSkillDir = Join-Path $agentsSkillsDir $sd.Name
    New-Item -ItemType Directory -Path $targetSkillDir -Force | Out-Null
    
    # Reuse the canonical description so agents can trigger the skill correctly
    $skillDesc = "Skill defined in .ai/skills/$($sd.Name)"
    $canon = Join-Path $sd.FullName "SKILL.md"
    if (Test-Path $canon) {
        $m = Select-String -Path $canon -Pattern "^description:\s*(.+)$" | Select-Object -First 1
        if ($m) { $skillDesc = $m.Matches[0].Groups[1].Value.Trim() }
    }

    $skillLines = @(
        "---",
        ("name: {0}" -f $sd.Name),
        ("description: {0}" -f $skillDesc),
        "---",
        "",
        ("Follow the canonical instructions in [``.ai/skills/{0}/SKILL.md``](../../../.ai/skills/{0}/SKILL.md)." -f $sd.Name)
    )
    $skillStub = ([string]::Join("`n", $skillLines) + "`n")
    Write-Utf8 (Join-Path $targetSkillDir "SKILL.md") $skillStub
    Write-Host ("  [OK] Linked skill: {0} -> .agents/skills" -f $sd.Name) -ForegroundColor Green
}

Write-Host ""
Write-Host "Tool synchronization complete! Native autocomplete is now active for:" -ForegroundColor Green
Write-Host "   - Claude Code CLI (/feature, /refactor, /review, /knowledge-review)" -ForegroundColor White
Write-Host "   - Cursor (/feature, /refactor, /review, /knowledge-review)" -ForegroundColor White
Write-Host "   - Antigravity and Agent runners (skills discovery in .agents/skills)" -ForegroundColor White
