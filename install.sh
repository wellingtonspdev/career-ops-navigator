#!/usr/bin/env bash
set -e

echo "🚀 Instalando career-ops-navigator globalmente..."

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SOURCE_SKILL="$SCRIPT_DIR/.agents/skills/career-ops-navigator"

if [ ! -d "$SOURCE_SKILL" ]; then
    SOURCE_SKILL="$SCRIPT_DIR"
fi

TARGETS=(
    "$HOME/.claude/skills/career-ops-navigator"
    "$HOME/.codex/skills/career-ops-navigator"
    "$HOME/.copilot/skills/career-ops-navigator"
    "$HOME/.gemini/config/skills/career-ops-navigator"
)

for TARGET in "${TARGETS[@]}"; do
    mkdir -p "$(dirname "$TARGET")"
    rm -rf "$TARGET"
    cp -r "$SOURCE_SKILL" "$TARGET"
    echo "  ✅ Instalado em: $TARGET"
done

echo "🎉 Instalação concluída! Reinicie seu CLI de IA para carregar a nova skill."
