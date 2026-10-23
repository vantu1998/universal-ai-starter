#!/usr/bin/env bash
# Universal AI-OS — One-Line Installer for macOS / Linux / WSL / Git Bash
# Usage: curl -sSL https://raw.githubusercontent.com/vantu1998/universal-ai-starter/main/install.sh | bash

set -e

REPO="vantu1998/universal-ai-starter"
BRANCH="main"
TAR_URL="https://github.com/${REPO}/archive/refs/heads/${BRANCH}.tar.gz"

echo ""
echo "🚀 Installing Universal AI-OS into current directory..."
echo "📂 Target: $(pwd)"
echo ""

# Create temporary directory
TMP_DIR=$(mktemp -d)
trap 'rm -rf "$TMP_DIR"' EXIT

# Download and extract tarball
if command -v curl >/dev/null 2>&1; then
    curl -sSL "$TAR_URL" | tar -xz -C "$TMP_DIR" --strip-components=1
elif command -v wget >/dev/null 2>&1; then
    wget -qO- "$TAR_URL" | tar -xz -C "$TMP_DIR" --strip-components=1
else
    echo "❌ Error: Neither curl nor wget is available."
    exit 1
fi

# Copy .ai directory
mkdir -p .ai
cp -r "$TMP_DIR/.ai/"* .ai/
echo "  [✓] Installed .ai/ (commands, skills, rules, knowledge)"

# Copy root template files without overwriting existing files
for file in "AGENTS.md" "STATE.md" "ROADMAP.md" ".cursorrules"; do
    if [ ! -f "$file" ]; then
        cp "$TMP_DIR/$file" "./$file"
        echo "  [✓] Created $file"
    else
        echo "  [!] $file already exists (skipped to preserve your work)"
    fi
done

echo ""
echo "🎉 Universal AI-OS installed successfully!"
echo "👉 Next steps:"
echo "   1. Edit AGENTS.md with your project's tech stack."
echo "   2. Open your project in Cursor, Claude Code, or Antigravity and start pairing!"
echo ""
