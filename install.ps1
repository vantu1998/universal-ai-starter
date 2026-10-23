# Universal AI-OS — One-Line Installer for Windows PowerShell
# Usage: irm https://raw.githubusercontent.com/vantu1998/universal-ai-starter/main/install.ps1 | iex

$ErrorActionPreference = "Stop"

Write-Host ""
Write-Host "Installing Universal AI-OS into current directory..." -ForegroundColor Cyan
Write-Host ("Target: {0}" -f (Get-Location).Path) -ForegroundColor Gray
Write-Host ""

$tempDir = Join-Path $env:TEMP ("ai-os-" + [System.Guid]::NewGuid().ToString("N"))
New-Item -ItemType Directory -Path $tempDir -Force | Out-Null

try {
    # Pin a release for reproducible installs:  $env:AI_OS_REF = "v1.0.0"
    $ref = if ($env:AI_OS_REF) { $env:AI_OS_REF } else { "main" }
    $zipUrl = "https://github.com/vantu1998/universal-ai-starter/archive/$ref.zip"
    $zipFile = Join-Path $tempDir "package.zip"

    if ($env:AI_OS_SRC) {
        # Local checkout (used by CI)
        $extractedRoot = (Resolve-Path $env:AI_OS_SRC).Path
    } else {
        Write-Host "  [1/4] Downloading Universal AI-OS package..." -ForegroundColor Gray
        [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
        Invoke-WebRequest -Uri $zipUrl -OutFile $zipFile -UseBasicParsing

        Write-Host "  [2/4] Extracting files..." -ForegroundColor Gray
        Expand-Archive -Path $zipFile -DestinationPath $tempDir -Force
        $extractedRoot = (Get-ChildItem -Path $tempDir -Directory | Where-Object { $_.Name -like "universal-ai-starter-*" } | Select-Object -First 1).FullName
    }

    # Copy .ai folder
    if (Test-Path (Join-Path $extractedRoot ".ai")) {
        # Never overwrite existing files (preserves your knowledge/ and customised rules)
        $srcAi = Join-Path $extractedRoot ".ai"
        Get-ChildItem -Path $srcAi -Recurse -File | ForEach-Object {
            $rel = $_.FullName.Substring($srcAi.Length).TrimStart("\")
            $dest = Join-Path ".ai" $rel
            if (-not (Test-Path $dest)) {
                New-Item -ItemType Directory -Path (Split-Path $dest -Parent) -Force | Out-Null
                Copy-Item -Path $_.FullName -Destination $dest
            }
        }
        Write-Host "  [OK] Installed .ai/ (existing files preserved)" -ForegroundColor Green
    }

    # Copy scripts folder
    if (Test-Path (Join-Path $extractedRoot "scripts")) {
        Copy-Item -Path (Join-Path $extractedRoot "scripts") -Destination "./" -Recurse -Force
        Write-Host "  [OK] Installed scripts/ (tool sync engine)" -ForegroundColor Green
    }

    # Copy root files without overwriting existing files
    $rootFiles = @("AGENTS.md", "CLAUDE.md", "GEMINI.md", "STATE.md", "ROADMAP.md", ".cursorrules", ".github/copilot-instructions.md", ".claude/settings.json")
    foreach ($file in $rootFiles) {
        $sourcePath = Join-Path $extractedRoot $file
        if (Test-Path $sourcePath) {
            if (-not (Test-Path "./$file")) {
                New-Item -ItemType Directory -Path (Split-Path "./$file" -Parent) -Force | Out-Null
                Copy-Item -Path $sourcePath -Destination "./$file" -Force
                Write-Host ("  [OK] Created {0}" -f $file) -ForegroundColor Green
            } else {
                Write-Host ("  [!] {0} already exists (skipped to preserve your work)" -f $file) -ForegroundColor Yellow
            }
        }
    }

    # Run native tool sync automatically
    if (Test-Path ".\scripts\sync.ps1") {
        Write-Host "  [3/4] Projecting native adapters (.claude, .cursor, .agents)..." -ForegroundColor Cyan
        & ".\scripts\sync.ps1" | Out-Null
        Write-Host "  [OK] Native slash commands and skills enabled!" -ForegroundColor Green
    }

    Write-Host ""
    Write-Host "Universal AI-OS installed successfully!" -ForegroundColor Green
    Write-Host "Next steps:" -ForegroundColor Cyan
    Write-Host "   1. Edit AGENTS.md with your project tech stack." -ForegroundColor White
    Write-Host "   2. Open your project in Cursor, Claude Code, or Antigravity and start pairing!" -ForegroundColor White
    Write-Host ""
}
catch {
    Write-Error ("Installation failed: {0}" -f $_)
}
finally {
    if (Test-Path $tempDir) {
        Remove-Item -Path $tempDir -Recurse -Force -ErrorAction SilentlyContinue
    }
}
