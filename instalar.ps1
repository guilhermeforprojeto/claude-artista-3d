# Transforma o Claude Code em artista 3D: Blender MCP + 94 Blender Skills.
# Rode de dentro da pasta do SEU projeto (PowerShell):
#   powershell -ExecutionPolicy Bypass -File C:\caminho\para\instalar.ps1
# Requisitos: Blender, git e Claude Code (comando `claude`).
param([string]$Projeto = (Get-Location).Path)

if (-not (Get-Command git -ErrorAction SilentlyContinue))    { Write-Host "git nao encontrado."; exit 1 }
if (-not (Get-Command claude -ErrorAction SilentlyContinue)) { Write-Host "Claude Code nao encontrado. Instale antes de continuar."; exit 1 }

Write-Host "1/3  uv (necessario para o Blender MCP)"
if (-not (Get-Command uvx -ErrorAction SilentlyContinue)) {
  Write-Host "     uv nao encontrado. Instalando pelo instalador oficial (astral.sh)..."
  powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"
  $env:Path = "$env:USERPROFILE\.local\bin;$env:Path"
}

Write-Host "2/3  Blender MCP"
claude mcp add --scope user -e DISABLE_TELEMETRY=true blender -- uvx mcp-for-blender
if ($LASTEXITCODE -ne 0) { Write-Host "     (pode ja estar instalado)" }

Write-Host "3/3  Blender Skills (94 skills) em $Projeto\.claude\skills"
$tmp = Join-Path ([System.IO.Path]::GetTempPath()) ("blender-skills-" + [guid]::NewGuid())
git clone --depth 1 https://github.com/arjun988/blender-skills.git $tmp
if ($LASTEXITCODE -ne 0) { Write-Host "Falha ao clonar o repositorio de skills."; exit 1 }
$destino = Join-Path $Projeto ".claude\skills"
New-Item -ItemType Directory -Force -Path $destino | Out-Null
Copy-Item -Recurse -Force (Join-Path $tmp ".claude\skills\*") $destino
$total = (Get-ChildItem (Join-Path $tmp ".claude\skills") -Directory).Count
Remove-Item -Recurse -Force $tmp
Write-Host "     $total skills copiadas."

Write-Host ""
Write-Host "Quase pronto. Falta o addon no Blender:"
Write-Host "   1. Baixe o addon.py em https://github.com/ahujasid/mcp-for-blender"
Write-Host "   2. Blender > Edit > Preferences > Add-ons > Install... > escolha o addon.py > ative 'Blender MCP'"
Write-Host "   3. No Blender, aperte N > aba BlenderMCP > Connect"
Write-Host "   4. Reinicie o Claude Code na pasta do projeto e peca: 'Use o blender-director para...'"
