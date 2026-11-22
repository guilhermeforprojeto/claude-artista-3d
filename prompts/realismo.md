# Realismo por padrão

Modelagem em boa resolução não basta: o que faz o olho acreditar são **imperfeições, conexões e luz**. Sem isso, a cena parece feita de massinha. Siga esta lista em toda cena, a menos que o usuário peça um estilo não realista (low poly, cartoon, stylized).

## 1. Escala real

- Tudo em metros, com tamanhos de verdade (bancada ~0,9 m, porta ~2,1 m, cilindro de gás ~1,2 m) e escala aplicada (`Ctrl+A → Scale`).
- Textura, luz, desfoque e física dependem da escala. Escala errada quebra o realismo mesmo com bons materiais.

## 2. Nada de quina perfeita

- Modificador **Bevel** (2–3 segmentos, 1–3 mm em objetos pequenos, 5–10 mm em móveis) em toda quina de objeto fabricado.
- Quinas chanfradas pegam luz e são o primeiro sinal de "objeto real".

## 3. Cabos, mangueiras e conexões

- Cabo é **curva com espessura** (Curve + Bevel), com peso: cai, encosta no chão ou na mesa e faz curvas suaves. Nunca tubo reto nem curva flutuando.
- **Toda ponta tem conector**: plugue, rosca, engate rápido, abraçadeira e capa de borracha (strain relief). Cabo nunca "entra" num objeto sem peça de encaixe.
- Nenhuma geometria atravessa outra. Confira em close.
- Sensores, braçadeiras e conexões abraçam ou rosqueiam de verdade a peça onde estão.

## 4. Materiais PBR com variação

- Use texturas PBR reais (cor, roughness, normal) em vez de cor chapada. Fonte padrão: **Poly Haven** (CC0, uso comercial liberado). Informe a licença de tudo que baixar.
- Todo material tem **variação**: roughness que muda pela superfície, riscos, poeira em superfícies horizontais, digitais em telas e metal polido, desgaste nas bordas, leve sujeira nas frestas.
- Metal pintado ≠ metal escovado ≠ latão ≠ borracha ≠ plástico: cada um com roughness e reflexo próprios.
- Telas: vidro com reflexo leve por cima da interface e brilho (emission) moderado.

## 5. Luz com intenção

- **HDRI** de ambiente coerente com a cena (oficina, escritório, rua) como base de reflexos.
- Uma **luz principal** com direção clara (janela, luminária), uma de preenchimento fraca e uma de **recorte** para separar o objeto do fundo.
- Fontes de luz dentro da cena (tela, arco de solda, LED) iluminam os objetos ao redor.
- Contraste de temperatura (quente × frio) em vez de tudo numa cor só.

## 6. Cena habitada

- O objeto principal nunca fica sozinho num fundo vazio: adicione elementos coerentes ao fundo (ferramentas, prateleiras, papéis), desfocados.
- Chão e paredes com marcas, manchas e variação.
- Atmosfera quando faz sentido: poeira no ar, fumaça leve, volumetria fraca.

## 7. Câmera e render

- **Cycles** com denoise, view transform **AgX**, profundidade de campo pela lente (f/2.8–5.6) e um pouco de motion blur nas animações.
- Lentes reais (24–85 mm) e câmera com leve imperfeição (movimento suave, nada robótico).
- Um pouco de granulado e vinheta na pós.

## 8. Confira antes de seguir

Depois de cada etapa, faça um render de teste do mesmo enquadramento e responda para si mesmo: *tem alguma quina perfeita? algum cabo sem conector ou atravessando algo? alguma superfície de cor chapada? de onde vem a luz?* Corrija antes de avançar e mostre o antes e depois ao usuário.

---

## Sem fotos reais do produto

Quando o usuário não tem fotos para usar como referência no Seedance (ou em outra IA de vídeo):

1. Aplique toda esta lista e faça **renders estáticos em alta qualidade** do produto: frente, 3/4, lateral e close dos detalhes (conectores, tela, marca), com fundo neutro e com a cena completa.
2. Esses renders viram as **imagens de referência do produto** no Seedance. Quanto mais realistas, mais o Seedance consegue "fotografar" o produto sem inventar.
3. Se o usuário tiver acesso a um gerador de imagem que aceita imagem de referência, ele pode passar um desses renders para gerar uma versão fotográfica e usar como referência extra. Confira que formato, botões, conectores e proporções continuaram iguais; descarte a imagem se algo mudou.
4. No prompt do Seedance, deixe claro: *"The product must match [Image1] exactly: same shape, colors, ports and proportions. Make materials and lighting photorealistic."*
5. Interface, logo e textos continuam fora da IA de vídeo e entram na montagem.
