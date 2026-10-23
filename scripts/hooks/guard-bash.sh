#!/usr/bin/env bash
# PreToolUse hook (Claude Code): block destructive shell commands.
# Enforces .ai/rules/security.md section 3. Exit code 2 = block and show stderr to the agent.
# Reads the tool-call JSON on stdin; no jq dependency.

input="$(cat)"
cmd="$(printf '%s' "$input" | tr '\n' ' ')"

block() {
    echo "Blocked by scripts/hooks/guard-bash.sh: $1. Ask the user for explicit approval (see .ai/rules/security.md)." >&2
    exit 2
}

case "$cmd" in
    *"rm -rf /"*|*"rm -rf ~"*|*"rm -rf *"*) block "recursive delete of a broad path" ;;
    *"git push --force"*|*"git push -f"*|*"push --force-with-lease"*) block "force push" ;;
    *"git reset --hard"*) block "git reset --hard" ;;
    *"DROP TABLE"*|*"DROP DATABASE"*|*"drop table"*|*"drop database"*) block "destructive SQL" ;;
esac

if printf '%s' "$cmd" | grep -Eq '(curl|wget)[^|]*\|[[:space:]]*(sudo[[:space:]]+)?(ba|z)?sh'; then
    block "piping a remote script into a shell"
fi

exit 0