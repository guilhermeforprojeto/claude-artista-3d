#!/usr/bin/env bash
# Transforma o Claude Code em artista 3D: Blender MCP + 94 Blender Skills.
# Rode de dentro da pasta do SEU projeto:  bash /caminho/para/instalar.sh
# Requisitos: Blender, git e Claude Code (comando `claude`).
set -euo pipefail

PROJETO="${1:-$PWD}"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

command -v git >/dev/null    || { echo "❌ git não encontrado."; exit 1; }
command -v claude >/dev/null || { echo "❌ Claude Code não encontrado. Instale antes de continuar."; exit 1; }

echo "1/3  uv (necessário para o Blender MCP)"
if ! command -v uvx >/dev/null; then
  echo "     uv não encontrado. Instalando pelo instalador oficial (astral.sh)…"
  curl -LsSf https://astral.sh/uv/install.sh | sh
  export PATH="$HOME/.local/bin:$PATH"
fi

echo "2/3  Blender MCP"
claude mcp add --scope user -e DISABLE_TELEMETRY=true blender -- uvx mcp-for-blender || echo "     (pode já estar instalado)"

echo "3/3  Blender Skills (94 skills) em $PROJETO/.claude/skills"
git clone --depth 1 https://github.com/arjun988/blender-skills.git "$TMP/blender-skills"
mkdir -p "$PROJETO/.claude/skills"
cp -R "$TMP/blender-skills/.claude/skills/." "$PROJETO/.claude/skills/"
echo "     $(find "$TMP/blender-skills/.claude/skills" -mindepth 1 -maxdepth 1 -type d | wc -l | tr -d ' ') skills copiadas."

cat <<'FIM'

✅ Quase pronto. Falta o addon no Blender:
   1. Baixe o addon.py em https://github.com/ahujasid/mcp-for-blender
   2. Blender → Edit → Preferences → Add-ons → Install… → escolha o addon.py → ative "Blender MCP"
   3. No Blender, aperte N → aba BlenderMCP → Connect
   4. Reinicie o Claude Code na pasta do projeto e peça: "Use o blender-director para…"
FIM
