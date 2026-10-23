#!/usr/bin/env bash
# Template Cleanup Script
# Runs once when a new repository is created from the template.
# Cleans maintainer files, personalizes metadata, and self-destructs.

set -e

REPO_NAME="${GITHUB_REPOSITORY#*/}"
[ -n "$REPO_NAME" ] || REPO_NAME="my-project"
echo "Initializing fresh project from template: $REPO_NAME"

# 1. Remove maintainer-only files from upstream starter
git rm -f CHANGELOG.md CONTRIBUTING.md SECURITY.md install.sh install.ps1 2>/dev/null || true
[ -f .github/CODEOWNERS ] && git rm -f .github/CODEOWNERS 2>/dev/null || true

# 2. Personalize STATE.md and AGENTS.md with new project name
if [ -f STATE.md ]; then
  sed -i "s/\[Your Project Name\]/$REPO_NAME/g" STATE.md 2>/dev/null || true
fi
if [ -f AGENTS.md ]; then
  sed -i "s/\[Your Project Name Here\]/$REPO_NAME/g" AGENTS.md 2>/dev/null || true
fi

# 3. Create a clean project README.md
cat <<EOF > README.md
# $REPO_NAME

This project is powered by the **[Universal AI Operating System](https://github.com/vantu1998/universal-ai-starter)** framework for disciplined, spec-driven AI pair programming.

## 🚀 Getting Started

1. **Configure Your Tech Stack:** Open [\`AGENTS.md\`](AGENTS.md) and fill in your runtime, framework, and test commands.
2. **Define Tasks:** Break down your milestone into testable slices in [\`ROADMAP.md\`](ROADMAP.md).
3. **Start Pairing with AI:** Open your IDE (Cursor, Claude Code, Antigravity, or Copilot) and prompt:
   > *"Read \`AGENTS.md\` and \`STATE.md\`, then execute Task 1.1 in \`ROADMAP.md\`."*

## 🛠️ Built-In AI Workflows

| Slash Command | Role | Description |
|---|---|---|
| **\`/feature\`** | **Feature Engineering** | Requirements Scope → Impact Analysis → Implementation → Automated Verification |
| **\`/refactor\`** | **Safe Refactoring** | Invariant-preserving refactoring with automated regression tests |
| **\`/review\`** | **Code Review** | Senior Engineer review for correctness, OWASP security, and performance |
| **\`/knowledge-review\`** | **Continuous Learning** | Capture solved bugs and architectural lessons into \`.ai/knowledge/\` |

## 🛡️ Active Safety Rails
- **PreToolUse Guard Hook:** Destructive terminal commands (\`rm -rf /\`, force push, hard reset) are automatically intercepted and blocked (\`scripts/hooks/guard-bash.sh\`).
- **Continuous Handover:** Sprints and context are anchored in \`STATE.md\` to prevent AI amnesia.
EOF

# 4. Self-destruct: remove this cleanup script and the workflow so they never run again
git rm -rf .github/scripts .github/workflows/template-cleanup.yml

# 5. Commit and push the clean slate
git config --global user.name "github-actions[bot]"
git config --global user.email "github-actions[bot]@users.noreply.github.com"
git add -A
git commit -m "chore: initialize $REPO_NAME from universal-ai-starter template"
git push origin main || echo "::warning::Could not push clean slate. Please ensure 'Read and write permissions' are enabled under Settings > Actions > General > Workflow permissions."
