# 03-profesional

Resultado del prompt de nivel profesional. El prompt funciona como **contrato técnico**: criterios de aceptación, arquitectura, edge cases y definition of done explícitos. El agente deja de improvisar y empieza a ejecutar contra una spec.

## Prompt usado

````
Construí un juego web de proyectiles tipo resortera. Quiero un único archivo
`index.html` con HTML, CSS y JavaScript inline, sin frameworks, sin
dependencias externas (ni siquiera CDN), corriendo abriéndolo directo en el
navegador.

## 1. Mecánicas obligatorias

- Resortera fija en el lado izquierdo. El jugador arrastra el proyectil
  hacia atrás (clic + drag) y al soltar, el proyectil se lanza con
  velocidad inicial proporcional al estiramiento de la goma.
- El proyectil es un círculo simple. Tiene gravedad constante y rebota
  con pérdida de energía contra el suelo y los lados.
- En el lado derecho hay 3 estructuras hechas de bloques rectangulares
  apilados. Las estructuras tienen distinto layout (no las tres iguales).
- Los bloques caen con gravedad cuando pierden apoyo (mini-física: detectar
  pérdida de soporte y dejarlos caer).
- El objetivo es derribar (sacar del rectángulo de juego, o bajar por
  debajo de un umbral Y) todos los bloques con la menor cantidad de
  lanzamientos.

## 2. UI obligatoria

- Contador de lanzamientos usados.
- Contador de bloques derribados / total.
- Botón "Reiniciar" siempre visible.
- Botón para mutear/desmutear el audio.
- Preview de trayectoria mientras se arrastra: una línea punteada que
  muestra la trayectoria parabólica calculada con la misma física que
  aplica al soltar. Debe coincidir con el vuelo real (no aproximación
  visual diferente). Esto es testeable: si la preview termina en (X, Y),
  el proyectil debe pasar por ahí al soltar con el mismo pull.
- Pantalla final cuando se derriban todos los bloques: mostrar
  "¡Completado en N lanzamientos!" con botón para jugar de nuevo.

## 3. Restricciones técnicas

- Un único archivo `index.html`. CSS en `<style>`, JS en `<script>`.
- Sin librerías externas, sin CDN, sin imports de red.
- Canvas 2D para renderizar. No DOM-based animation.
- **Canvas responsive**: el área de juego se adapta al ancho disponible
  manteniendo proporción 3:2 (ej. 1200x800 lógico se escala). La lógica
  del juego trabaja siempre en coordenadas lógicas fijas; el render
  aplica el factor de escala. Esto asegura que la física sea estable
  independientemente del tamaño de pantalla.
- Loop con `requestAnimationFrame`. Delta time real con cap superior
  (1/30 s) para evitar saltos al perder foco de la pestaña.
- Código en JavaScript moderno (ES2020+), `'use strict'` o IIFE.

## 4. Arquitectura del JS

Separación clara de responsabilidades, no un único bloque procedural.
Pensalo como cuatro capas conviviendo en el mismo archivo:

- **Estado**: un objeto `state` con `projectile`, `blocks`, `slingshot`,
  `particles`, `stats`. Las mutaciones pasan por funciones nombradas.
- **Física**: funciones que reciben estado y delta time y aplican las
  reglas físicas. No tocan el DOM ni el canvas.
- **Render**: funciones que reciben estado y dibujan al canvas. Nunca
  mutan estado.
- **Input**: handlers de mouse/touch que actualizan estado pero no
  tocan física ni render directamente.

El game loop orquesta: `input (event-driven) → update(state, dt) → render(state)`.

## 5. Audio (SFX, sin música)

- Audio generado en runtime con `WebAudio` (`AudioContext`,
  osciladores y `GainNode`). Cero archivos externos.
- Tres SFX mínimos:
  - **launch**: al soltar la goma. Un "thwack" corto.
  - **hit**: al impactar un bloque. Variación de pitch para que no
    suene repetitivo.
  - **win**: al completar el desafío. Acorde corto, una sola vez.
- Botón mute persistente en la UI. El estado inicial es "no muteado",
  pero el `AudioContext` no se inicializa hasta el primer gesto del
  usuario (requisito de los browsers modernos).
- Sin música de fondo. La charla se da en vivo y la música compite con
  el presentador.

## 6. Polish gráfico

- Paleta limitada (4–6 colores) pero con identidad propia (no pastel
  genérico).
- Partículas al impacto del proyectil contra un bloque (10–20
  partículas pequeñas que viven 300–500 ms con gravedad).
- Animación sutil de la goma estirándose: la goma sigue al proyectil
  con un par de líneas finas que cambian de grosor según el
  estiramiento.
- Sombra suave del proyectil sobre el suelo (no `box-shadow`, sino una
  elipse oscura debajo del proyectil que se achata con la altura).
- Suelo con textura visible (líneas o patrones simples, no plano puro).
- Header tipográfico claro: título del juego + HUD legible a 2 metros
  del proyector.

## 7. Edge cases obligatorios

- Proyectil sale del canvas por cualquier lado: se descarta y se
  permite un nuevo lanzamiento.
- Proyectil queda detenido (velocidad bajo umbral durante N ms): se
  descarta automáticamente y se permite un nuevo lanzamiento.
- Drag iniciado fuera del proyectil: no hace nada.
- **Drag soltado fuera del canvas**: igual debe ejecutar el lanzamiento.
  Usar listeners en `window`, no solo en el canvas. Bug clásico.
- **Mouse que sale del canvas durante el drag**: el drag continúa hasta
  que se suelta el botón, incluso fuera del área de juego.
- Drag muy largo: se limita visualmente y en magnitud para que la
  velocidad inicial no sea infinita.
- Bloque que cae fuera del canvas: cuenta como derribado y deja de
  renderizarse / colisionar.
- Click en "Reiniciar" durante un lanzamiento activo: cancela el
  lanzamiento y resetea contadores, estructuras y posición.
- Resize de ventana: el canvas se re-renderiza con la nueva escala sin
  perder estado de juego.
- Pestaña que pierde foco: el dt se capea, el juego no se "teletransporta"
  al volver.

## 8. Calidad de código

- Identificadores en inglés, comentarios en español. Solo comentarios
  donde el "por qué" no es obvio.
- Constantes mágicas (gravedad, fricción, tamaños, umbrales, colores)
  declaradas en un bloque `CONFIG` al inicio del script.
- Sin variables globales sueltas: el código vive dentro de un IIFE.
- Sin `console.log` ni código muerto.
- Sin `setTimeout` para timing del game loop: solo
  `requestAnimationFrame` con delta time. Para secuenciar audio (notas
  encadenadas dentro de un mismo SFX) sí se acepta `setTimeout` o el
  scheduling propio del `AudioContext` (`osc.start(now + offset)`).
- Balance: el desafío debe ser **terminable**. Validar manualmente que
  con buen ángulo y máximo pull, los bloques de la estructura más
  lejana son alcanzables.

## 9. Definition of Done

- [ ] Abrir `index.html` en el navegador muestra el juego corriendo sin
      servidor.
- [ ] El canvas se adapta al ancho del viewport y se ve completo sin
      scroll horizontal en pantallas desde 600px hasta 1920px.
- [ ] No hay errores ni warnings en la consola al cargar ni al jugar
      2 minutos.
- [ ] La preview de trayectoria predice fielmente dónde caerá el
      proyectil (verificable visualmente: la línea termina donde el
      proyectil aterriza).
- [ ] Los tres SFX se reproducen en los momentos correctos.
- [ ] Botón mute funciona y persiste mientras dura la sesión.
- [ ] Soltar el mouse fuera del canvas dispara el lanzamiento; no
      queda trabado.
- [ ] Resize de ventana mantiene el juego jugable sin perder estado.
- [ ] Los dos contadores se actualizan correctamente.
- [ ] El botón Reiniciar restaura el estado inicial.
- [ ] Se cumplen todos los edge cases de la sección 7.
- [ ] Se respeta la arquitectura de cuatro capas (Estado, Física,
      Render, Input).
- [ ] El bloque `CONFIG` existe y agrupa las constantes.
- [ ] Identificadores en inglés, comentarios en español, sin
      `console.log` ni código muerto.
- [ ] Con máximo pull y buen ángulo, las 3 estructuras son
      alcanzables.

No entregues el código hasta que puedas marcar los 15 puntos.
````

## Qué se espera del resultado

- Código organizado con las cuatro capas explícitas.
- Trayectoria preview que coincide con el vuelo real (simulación, no estimación visual).
- SFX generados en runtime con WebAudio, mutables desde la UI.
- Partículas, sombra, goma animada, paleta con identidad.
- Canvas responsive con coordenadas lógicas fijas.
- Cumplimiento estricto de la DoD de 15 puntos.

## Qué observar en la comparación

- La diferencia más visible no es gráfica: es estructural. Pero ahora también es **funcional**: la preview no miente, el mouse no se traba, el canvas se adapta.
- El agente deja de improvisar y empieza a ejecutar contra una spec.
- El humano paga upfront escribiendo el prompt largo, pero recupera ese tiempo en menos iteraciones de corrección.

## Archivo

Ver [`index.html`](./index.html) en esta misma carpeta.
