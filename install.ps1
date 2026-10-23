# Universal AI-OS — One-Line Installer for Windows PowerShell
# Usage: irm https://raw.githubusercontent.com/vantu1998/universal-ai-starter/main/install.ps1 | iex

$ErrorActionPreference = "Stop"

Write-Host ""
Write-Host "🚀 Installing Universal AI-OS into current directory..." -ForegroundColor Cyan
Write-Host "📂 Target: $((Get-Location).Path)" -ForegroundColor Gray
Write-Host ""

$tempDir = Join-Path $env:TEMP ("ai-os-" + [System.Guid]::NewGuid().ToString("N"))
New-Item -ItemType Directory -Path $tempDir -Force | Out-Null

try {
    $zipUrl = "https://github.com/vantu1998/universal-ai-starter/archive/refs/heads/main.zip"
    $zipFile = Join-Path $tempDir "package.zip"

    Write-Host "  [↓] Downloading Universal AI-OS package..." -ForegroundColor Gray
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    Invoke-WebRequest -Uri $zipUrl -OutFile $zipFile -UseBasicParsing

    Write-Host "  [x] Extracting files..." -ForegroundColor Gray
    Expand-Archive -Path $zipFile -DestinationPath $tempDir -Force
    $extractedRoot = Join-Path $tempDir "universal-ai-starter-main"

    # Copy .ai folder
    if (Test-Path (Join-Path $extractedRoot ".ai")) {
        Copy-Item -Path (Join-Path $extractedRoot ".ai") -Destination "./" -Recurse -Force
        Write-Host "  [✓] Installed .ai/ (commands, skills, rules, knowledge)" -ForegroundColor Green
    }

    # Copy scripts folder
    if (Test-Path (Join-Path $extractedRoot "scripts")) {
        Copy-Item -Path (Join-Path $extractedRoot "scripts") -Destination "./" -Recurse -Force
        Write-Host "  [✓] Installed scripts/ (tool sync engine)" -ForegroundColor Green
    }

    # Copy root files without overwriting existing files
    $rootFiles = @("AGENTS.md", "STATE.md", "ROADMAP.md", ".cursorrules")
    foreach ($file in $rootFiles) {
        $sourcePath = Join-Path $extractedRoot $file
        if (Test-Path $sourcePath) {
            if (-not (Test-Path "./$file")) {
                Copy-Item -Path $sourcePath -Destination "./$file" -Force
                Write-Host "  [✓] Created $file" -ForegroundColor Green
            } else {
                Write-Host "  [!] $file already exists (skipped to preserve your work)" -ForegroundColor Yellow
            }
        }
    }

    # Run native tool sync automatically
    if (Test-Path ".\scripts\sync.ps1") {
        Write-Host "  [⚡] Projecting native adapters (.claude, .cursor, .agents)..." -ForegroundColor Cyan
        & ".\scripts\sync.ps1" | Out-Null
        Write-Host "  [✓] Native slash commands & skills enabled!" -ForegroundColor Green
    }

    Write-Host ""
    Write-Host "🎉 Universal AI-OS installed successfully!" -ForegroundColor Green
    Write-Host "👉 Next steps:" -ForegroundColor Cyan
    Write-Host "   1. Edit AGENTS.md with your project's tech stack." -ForegroundColor White
    Write-Host "   2. Open your project in Cursor, Claude Code, or Antigravity and start pairing!" -ForegroundColor White
    Write-Host ""
}
catch {
    Write-Error "❌ Installation failed: $_"
}
finally {
    if (Test-Path $tempDir) {
        Remove-Item -Path $tempDir -Recurse -Force -ErrorAction SilentlyContinue
    }
}
