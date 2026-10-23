#!/usr/bin/env bash
# Universal AI-OS — One-Line Installer for macOS / Linux / WSL / Git Bash
# Usage: curl -sSL https://raw.githubusercontent.com/vantu1998/universal-ai-starter/main/install.sh | bash

set -e

REPO="vantu1998/universal-ai-starter"
# Pin a release for reproducible installs:  AI_OS_REF=v1.0.0 bash install.sh
REF="${AI_OS_REF:-main}"
TAR_URL="https://github.com/${REPO}/archive/${REF}.tar.gz"

echo ""
echo "🚀 Installing Universal AI-OS into current directory..."
echo "📂 Target: $(pwd)"
echo ""

# Create temporary directory
TMP_DIR=$(mktemp -d)
trap 'rm -rf "$TMP_DIR"' EXIT

# Use a local checkout (AI_OS_SRC, used by CI) or download and extract the tarball
if [ -n "${AI_OS_SRC:-}" ]; then
    cp -r "$AI_OS_SRC/." "$TMP_DIR/"
else
    if command -v curl >/dev/null 2>&1; then
        curl -sSL "$TAR_URL" | tar -xz -C "$TMP_DIR" --strip-components=1
    elif command -v wget >/dev/null 2>&1; then
        wget -qO- "$TAR_URL" | tar -xz -C "$TMP_DIR" --strip-components=1
    else
        echo "❌ Error: Neither curl nor wget is available."
        exit 1
    fi
fi

# Copy .ai directory
mkdir -p .ai
# -n: never overwrite existing files (preserves your knowledge/ and customised rules)
cp -rn "$TMP_DIR/.ai/"* .ai/ 2>/dev/null || true
echo "  [✓] Installed .ai/ (existing files preserved)"

# Copy scripts directory
mkdir -p scripts
cp -r "$TMP_DIR/scripts/"* scripts/
chmod +x scripts/*.sh 2>/dev/null || true
echo "  [✓] Installed scripts/ (tool sync engine)"

# Copy root template files without overwriting existing files
for file in "AGENTS.md" "CLAUDE.md" "GEMINI.md" "STATE.md" "ROADMAP.md" ".cursorrules" ".github/copilot-instructions.md" ".claude/settings.json"; do
    [ -f "$TMP_DIR/$file" ] || continue
    if [ ! -f "$file" ]; then
        mkdir -p "$(dirname "$file")"
        cp "$TMP_DIR/$file" "./$file"
        echo "  [✓] Created $file"
    else
        echo "  [!] $file already exists (skipped to preserve your work)"
    fi
done

# Run native tool sync automatically
if [ -f "./scripts/sync.sh" ]; then
    echo "  [⚡] Projecting native adapters (.claude, .cursor, .agents)..."
    bash ./scripts/sync.sh >/dev/null 2>&1 || true
    echo "  [✓] Native slash commands & skills enabled!"
fi

echo ""
echo "🎉 Universal AI-OS installed successfully!"
echo "👉 Next steps:"
echo "   1. Edit AGENTS.md with your project's tech stack."
echo "   2. Open your project in Cursor, Claude Code, or Antigravity and start pairing!"
echo ""
