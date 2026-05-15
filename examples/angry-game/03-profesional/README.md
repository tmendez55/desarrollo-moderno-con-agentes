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
- El proyectil es un círculo simple. Tiene gravedad constante y rebota con
  pérdida de energía contra el suelo y los lados.
- En el lado derecho hay 3 estructuras hechas de bloques rectangulares
  apilados. Las estructuras tienen distinto layout (no las tres iguales).
- Los bloques caen con gravedad cuando pierden apoyo (mini-física, no hace
  falta motor real: basta con detectar pérdida de soporte y dejarlos caer).
- El objetivo es derribar (sacar del rectángulo de juego, o bajar por
  debajo de un umbral Y) tantos bloques como sea posible con la menor
  cantidad de lanzamientos.

## 2. UI obligatoria

- Contador de lanzamientos usados.
- Contador de bloques derribados / total.
- Botón "Reiniciar" siempre visible.
- Indicador visual del estiramiento de la goma mientras el jugador
  arrastra (línea o trayectoria preview).
- Pantalla final cuando se derriban todos los bloques: mostrar
  "¡Completado en N lanzamientos!" con botón para jugar de nuevo.

## 3. Restricciones técnicas

- Un único archivo `index.html`. CSS en `<style>`, JS en `<script>`.
- Sin librerías externas, sin CDN, sin imports de red.
- Canvas 2D para renderizar. No DOM-based animation.
- Resolución del canvas fija (por ejemplo 900x600). No hace falta
  responsive.
- Loop con `requestAnimationFrame`. Delta time real (no asumir 60fps
  constantes).
- Código en JavaScript moderno (ES2020+), `'use strict'` o módulo
  implícito.

## 4. Arquitectura del JS

Separación clara de responsabilidades, no un único bloque procedural.
Pensalo como cuatro capas conviviendo en el mismo archivo:

- **Estado**: un objeto `state` con `projectile`, `blocks`, `slingshot`,
  `stats`. Inmutable a nivel referencia desde fuera; las mutaciones pasan
  por funciones.
- **Física**: funciones puras que reciben estado y delta time y
  devuelven nuevo estado (gravedad, colisión proyectil-bloque,
  colisión proyectil-suelo, soporte de bloques).
- **Render**: funciones que reciben estado y dibujan al canvas. Nunca
  mutan estado.
- **Input**: handlers de mouse/touch que actualizan estado pero no
  tocan física ni render directamente.

El game loop orquesta: `input → update(state, dt) → render(state)`.

## 5. Edge cases obligatorios

- Proyectil sale del canvas por cualquier lado: se descarta y se permite
  un nuevo lanzamiento.
- Proyectil queda detenido (velocidad bajo umbral durante N ms): se
  descarta automáticamente y se permite un nuevo lanzamiento.
- Drag iniciado fuera del proyectil: no hace nada (no "teletransporta"
  la goma).
- Drag muy largo: se limita visualmente y en magnitud para que la
  velocidad inicial no sea infinita.
- Bloque que cae fuera del canvas: cuenta como derribado y deja de
  renderizarse / colisionar.
- Click en "Reiniciar" durante un lanzamiento activo: cancela el
  lanzamiento y resetea contadores, estructuras y posición.
- Resize de ventana: no requerido (canvas tiene tamaño fijo), pero el
  juego no debe romper si pasa.

## 6. Estilo visual

- Colores planos, estilo minimalista. Paleta limitada (3–5 colores
  total).
- Sin gradientes, sin sombras complejas, sin texturas.
- Fondo de color sólido. Suelo como una línea o rectángulo de color
  diferente.
- Proyectil de un color que contraste con el fondo y con los bloques.
- La estética es secundaria respecto a la calidad del código y la
  jugabilidad.

## 7. Calidad de código

- Identificadores en inglés, comentarios en español (consistente con el
  resto del proyecto). Solo comentarios donde el "por qué" no es obvio;
  no comentar lo que el nombre ya dice.
- Constantes mágicas (gravedad, fricción, tamaños, umbrales) declaradas
  en un bloque `CONFIG` al inicio del script, no esparcidas en el
  código.
- Sin variables globales sueltas: el código vive dentro de un IIFE o
  bloque `{}` para no contaminar el scope global.
- Sin `console.log` ni código muerto.
- Sin `setTimeout` para timing del juego: solo `requestAnimationFrame`
  con delta time.

## 8. Definition of Done

El trabajo está completo cuando se cumplen todos los puntos:

- [ ] Abrir `index.html` en el navegador muestra el juego corriendo sin
      necesidad de servidor.
- [ ] No hay errores ni warnings en la consola del navegador al cargar
      ni al jugar 2 minutos.
- [ ] Los tres tipos de mecánicas (arrastrar, soltar, ver caer bloques)
      funcionan.
- [ ] Los dos contadores se actualizan correctamente.
- [ ] El botón Reiniciar restaura el estado inicial.
- [ ] Se cumplen los seis edge cases listados en la sección 5.
- [ ] Se respeta la arquitectura de cuatro capas (Estado, Física,
      Render, Input) descrita en la sección 4.
- [ ] El bloque `CONFIG` existe y agrupa las constantes.
- [ ] Identificadores en inglés, comentarios en español, sin
      `console.log` ni código muerto.
- [ ] La paleta visual está limitada a 3–5 colores planos.

No entregues el código hasta que puedas marcar los diez puntos.
````

## Qué se espera del resultado

- Código organizado con separación clara entre estado del juego, lógica de física, renderizado y entrada del usuario.
- Cobertura explícita de edge cases (límites de la pantalla, proyectiles inactivos, reinicio).
- Decisiones de diseño documentadas dentro del código solo donde el "por qué" no sea obvio.
- Estética consistente con lo pedido.
- Cumplimiento estricto de la definition of done declarada en el prompt.

## Qué observar en la comparación

- La diferencia más visible no es gráfica: es estructural.
- El agente deja de improvisar y empieza a ejecutar contra una spec.
- El humano paga upfront escribiendo el prompt largo, pero recupera ese tiempo en menos iteraciones de corrección.

## Archivo

Ver [`index.html`](./index.html) en esta misma carpeta.
