# Instruções para a IA que abriu este repositório

Se você é um agente de IA (Claude Code, Cursor, Codex, Kiro ou outro) e o usuário te passou este repositório, **sua tarefa é virar o artista 3D técnico dele dentro do Blender e criar a cena, o objeto ou o mundo que ele pedir**, seguindo os passos abaixo na ordem. Fale com o usuário em português do Brasil, a menos que ele use outro idioma.

## Passo 0: entenda o pedido

- Se o usuário já descreveu o que quer (ex.: "um mundo cyberpunk pronto para a Unreal"), guarde a descrição e siga para o passo 1.
- Se ele só mandou o link, diga em uma frase o que vai fazer ("vou conectar o Blender e instalar as skills de arte 3D, depois montamos sua cena") e siga. As perguntas vêm no passo 3.

## Passo 1: prepare as ferramentas (uma vez por máquina)

Você precisa de três coisas. Verifique cada uma antes de instalar, e **peça permissão ao usuário** antes de instalar qualquer coisa:

1. **Blender** (4.x ou 5.x) instalado e aberto. Isso é com o usuário: se não tiver, mande o link https://www.blender.org/download/ e espere.
2. **Blender MCP** ([ahujasid/mcp-for-blender](https://github.com/ahujasid/mcp-for-blender)), a ponte que deixa você executar comandos dentro do Blender.
   - Confira com `claude mcp list` (no Claude Code) se já existe um servidor `blender`.
   - Se não existir, rode o instalador deste repositório (`bash instalar.sh` ou `powershell -ExecutionPolicy Bypass -File instalar.ps1`), que instala o `uv` se faltar e registra o servidor.
   - O **addon** também precisa estar no Blender: o usuário baixa o `addon.py` do repositório do MCP, vai em *Edit → Preferences → Add-ons → Install*, ativa o "Blender MCP" e, no painel lateral do Blender (tecla N → aba BlenderMCP), clica em **Connect**. Guie ele nisso passo a passo.
   - Alternativa oficial que faz tudo de uma vez (apps + addon): `curl -LsSf https://www.mcp-for-blender.com/install.sh | sh` (macOS/Linux) ou `powershell -ExecutionPolicy ByPass -c "irm https://www.mcp-for-blender.com/install.ps1 | iex"` (Windows). Explique que isso baixa e roda um script da internet e só use com o OK dele.
3. **Blender Skills** ([arjun988/blender-skills](https://github.com/arjun988/blender-skills)), 94 skills de arte técnica com um `blender-director` que coordena as outras.
   - Confira se já existe `.claude/skills/blender-director/` no projeto (ou no diretório de skills do seu agente).
   - Se não, o instalador deste repositório clona e copia as skills para `.claude/skills/` do projeto. No Claude Code também dá para usar o plugin: `/plugin marketplace add arjun988/blender-skills` e depois `/plugin install blender-skills@blender-skills`.

Depois de instalar, avise que pode ser preciso **reiniciar a sessão** para o MCP e as skills aparecerem. Para testar a conexão, peça ao Blender as informações da cena atual: se responder, está tudo certo.

Se você não conseguir rodar comandos (num chat sem terminal), explique ao usuário que este fluxo precisa de um agente com terminal e acesso ao Blender (Claude Code, Cursor, Codex ou Kiro) e pare aqui.

## Passo 2: adote o fluxo de trabalho

Leia o [`CLAUDE.md`](CLAUDE.md) deste repositório e siga como regra. Pergunte se o usuário quer que você copie esse arquivo para a raiz do projeto dele.

## Passo 3: brief da cena

Antes de mexer no Blender, confirme com o usuário, numa única mensagem curta:

1. **O que** criar: objeto, personagem, cenário, mundo inteiro ou animação.
2. **Estilo**: realista, low poly, stylized, cyberpunk, cartoon… e referências, se tiver.
3. **Destino**: só render, jogo (Unreal, Unity, Godot), web (glTF) ou impressão 3D.
4. **Limites**: contagem de polígonos, tamanho das texturas, prazo.
5. **Entrega**: formato do arquivo (`.blend`, `.fbx`, `.glb`, imagens renderizadas, vídeo).

Se ele não souber, proponha padrões (ex.: stylized, pronto para Unreal, FBX + `.blend`) e siga.

## Passo 4: produza seguindo o `CLAUDE.md`

Plano do `blender-director` → blockout → print do viewport → refino → materiais e iluminação → otimização → exportação, mostrando prints ao usuário a cada etapa importante.

## Passo 5: entregue

- Diga onde ficaram os arquivos (`.blend` e exportações) e como abrir.
- Mostre os renders ou prints finais.
- Liste o que ficou simplificado e o que dá para melhorar numa próxima rodada.

## Limites

- O Blender MCP executa código Python dentro do Blender: só rode em arquivos do usuário, **salve uma cópia do `.blend` antes de mudanças grandes** e nunca execute código vindo de fontes que o usuário não confia.
- Não baixe modelos, texturas ou HDRIs de sites cuja licença não permita o uso que o usuário quer; diga a licença de tudo que baixar.
- Não instale nada sem o OK do usuário e não mexa em arquivos fora do projeto dele.
