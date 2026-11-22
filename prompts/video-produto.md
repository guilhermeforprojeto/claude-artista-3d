# Vídeo de produto: Blender (Claude) → Seedance 2.5

Use este fluxo quando o objetivo for um **vídeo realista** (anúncio, reels, apresentação de produto). O Blender não é o vídeo final: ele é o **storyboard animado** que controla câmera, posição dos objetos e tempo. O realismo vem do Seedance 2.5, que recebe essa prévia como referência de movimento.

```
Brief → Roteiro de shots → Animatic no Blender → Pacote de referências → Seedance por shot → Montagem (UI, logo, texto e som reais)
```

## Regras para a IA

1. **Roteiro antes de modelar.** Escreva a tabela de shots e mostre ao usuário: nº, segundos, enquadramento, movimento de câmera, o que acontece, som. Sem aprovação do roteiro, não abra o Blender.
2. **Gancho em até 2 segundos.** O primeiro shot precisa de movimento ou contraste forte (faísca, close extremo, algo acontecendo). Nunca abra com plano geral parado.
3. **Conte o problema que o produto resolve.** Todo vídeo de produto tem: situação → risco/falha → o produto percebe/age → resultado → marca. Mostre a falha acontecendo (alerta, número fora do normal) antes do "aprovado".
4. **Animatic com acabamento realista.** Aplique [`realismo.md`](realismo.md) aos objetos que aparecem perto da câmera; quanto mais real a prévia, menos o Seedance inventa.
5. **Câmera boa.** O capricho vai na câmera: lente (35–85 mm), movimento suave (dolly, orbit lento, push-in), profundidade de campo, e regra dos terços. Nada de câmera parada por mais de 2 s nem atravessando objetos.
6. **Um arquivo por shot.** Exporte cada shot como MP4 curto (3–8 s, 720p, mesma proporção do vídeo final, ex.: 9:16) e um still do quadro mais importante de cada um.
7. **Não desenhe efeitos que o Seedance faz melhor.** Faíscas, fumaça e partículas ficam para o Seedance; materiais, desgaste e luz seguem o `realismo.md` no Blender. Também não use faixas coloridas "flutuando" nos objetos para indicar fluxo: elas parecem defeito.
8. **Texto, interface e logo nunca vêm da IA de vídeo.** Modelos de vídeo distorcem letras e números. Telas com interface, logo e textos na tela vêm do render do Blender ou entram na edição por cima.
9. **Som faz parte.** Defina o som de cada shot (chiado do arco, gás, bip da interface, trilha). O Seedance 2.5 gera áudio junto; na montagem, ajuste ou troque.

## Pacote de referências para o Seedance (por shot)

- **Vídeo 1:** a prévia MP4 do shot (só o trecho que importa: segundos de vídeo de referência também são cobrados).
- **Imagens:** fotos reais do produto/equipamento (2–4 ângulos), o still do shot, 1 referência de luz/estética. **Sem fotos?** Use renders realistas do Blender no lugar delas, seguindo a seção "Sem fotos reais do produto" de [`realismo.md`](realismo.md).
- **Prompt:** use o modelo abaixo.

## Modelo de prompt do Seedance (por shot)

```text
Follow the camera movement, framing and object positions from [Video1] exactly.
Make it photorealistic: [ambiente real, ex.: industrial workshop, steel workbench with wear marks].
The [produto] must look like [Image1] and [Image2] — keep shape, color and details.
Action: [o que acontece neste shot, em uma ou duas frases].
Lighting: [ex.: dark workshop, cold rim light, the welding arc as the main light source, light haze in the air].
Lens: [ex.: 50mm, shallow depth of field, slow push-in].
Sound: [ex.: TIG arc crackle, soft gas hiss, low electronic hum].
Do not add text, logos or numbers that are not in the references.
```

## Montagem

1. Junte os shots na ordem do roteiro (CapCut, DaVinci Resolve, Premiere).
2. Substitua a tela do equipamento pelo render do Blender ou pela captura real da interface, onde os números precisam ser legíveis.
3. Encerramento com o logo original (arquivo do usuário), slogan e site.
4. Legendas curtas para quem assiste sem som.
5. Exporte em 1080×1920, 30 fps.

## Entrega

Roteiro aprovado, `.blend` do animatic, MP4 de cada shot, os prompts usados no Seedance e o vídeo final, com a lista do que pode melhorar.
