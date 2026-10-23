#!/usr/bin/env bash
# Universal AI-OS — Native Tool Sync Engine (Bash)
# Projects .ai/ commands and skills into native IDE discovery paths (.claude, .cursor, .agents)

set -e

ROOT="$(pwd)"
AI_CMD_DIR="$ROOT/.ai/commands"
AI_SKILLS_DIR="$ROOT/.ai/skills"

if [ ! -d "$AI_CMD_DIR" ]; then
    echo "❌ Error: Cannot find .ai/commands directory. Run this script from the repository root."
    exit 1
fi

echo "🔄 Synchronizing Universal AI-OS to native tool discovery folders..."

# 1. Setup target adapter directories
CLAUDE_CMD_DIR="$ROOT/.claude/commands"
CURSOR_CMD_DIR="$ROOT/.cursor/commands"
CURSOR_RULES_DIR="$ROOT/.cursor/rules"
AGENTS_SKILLS_DIR="$ROOT/.agents/skills"

mkdir -p "$CLAUDE_CMD_DIR" "$CURSOR_CMD_DIR" "$CURSOR_RULES_DIR" "$AGENTS_SKILLS_DIR"

# 2. Project commands to .claude/commands and .cursor/commands
for cmd_path in "$AI_CMD_DIR"/*.md; do
    cmd_file="$(basename "$cmd_path")"
    [ "$cmd_file" = "README.md" ] && continue
    cmd_name="${cmd_file%.md}"

    # Read description from the canonical command frontmatter
    desc="$(tr -d '\r' < "$cmd_path" | sed -n '/^---$/,/^---$/{s/^description:[[:space:]]*//p;}' | head -n 1)"
    [ -n "$desc" ] || desc="Execute $cmd_name workflow"

    cat <<EOF > "$CLAUDE_CMD_DIR/$cmd_file"
---
description: $desc
---

Follow the canonical instructions in [\`.ai/commands/$cmd_file\`](../../.ai/commands/$cmd_file).
EOF

    cp "$CLAUDE_CMD_DIR/$cmd_file" "$CURSOR_CMD_DIR/$cmd_file"
    echo "  [✓] Linked command: /$cmd_name -> .claude & .cursor"
done

# 3. Setup Cursor rule pointer
cat <<EOF > "$CURSOR_RULES_DIR/ai-source-of-truth.mdc"
---
description: Master pointer to Universal AI Operating System (.context & .ai)
alwaysApply: true
---

For all project rules, coding standards, and architectural constraints, read \`AGENTS.md\` and \`.ai/README.md\`.
Always check and update \`STATE.md\` for sprint handover.
EOF

# 4. Project skills to .agents/skills/ for Antigravity & Agent tools
for skill_path in "$AI_SKILLS_DIR"/*; do
    [ -d "$skill_path" ] || continue
    skill_name="$(basename "$skill_path")"

    mkdir -p "$AGENTS_SKILLS_DIR/$skill_name"
    # Reuse the canonical description so agents can trigger the skill correctly
    skill_desc="$(tr -d '\r' < "$skill_path/SKILL.md" | sed -n '/^---$/,/^---$/{s/^description:[[:space:]]*//p;}' | head -n 1)"
    [ -n "$skill_desc" ] || skill_desc="Skill defined in .ai/skills/$skill_name"
    cat <<EOF > "$AGENTS_SKILLS_DIR/$skill_name/SKILL.md"
---
name: $skill_name
description: $skill_desc
---

Follow the canonical instructions in [\`.ai/skills/$skill_name/SKILL.md\`](../../../.ai/skills/$skill_name/SKILL.md).
EOF
    echo "  [✓] Linked skill: $skill_name -> .agents/skills"
done

echo ""
echo "✅ Tool synchronization complete! Native autocomplete is now active for:"
echo "   - Claude Code CLI (/feature, /refactor, /review, /knowledge-review)"
echo "   - Cursor (/feature, /refactor, /review, /knowledge-review)"
echo "   - Antigravity & Agent runners (skills discovery in .agents/skills)"
