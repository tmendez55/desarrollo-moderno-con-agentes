# angry-game

Tres versiones del mismo reto resueltas por un agente con prompts de calidad creciente.

## El reto

Construir un juego web de proyectiles tipo resortera con estas restricciones:

- **Un solo archivo** `index.html` con HTML, CSS y JavaScript inline.
- **Sin frameworks** ni dependencias externas (ni siquiera CDN).
- **Sin servidor**: tiene que correr abriendo el archivo directamente en el navegador.
- **Jugable**: el jugador arrastra una resortera para lanzar un proyectil con física, e intenta derribar objetivos.

## Las tres versiones

Cada subcarpeta corresponde a un nivel de prompt:

| Carpeta | Prompt | Qué demuestra |
|---|---|---|
| [01-vago/](./01-vago) | Una sola frase informal y ambigua. | Lo que sale por defecto cuando no se da contexto. El agente compensa inventando. |
| [02-mejorado/](./02-mejorado) | Prompt estructurado con mecánicas, restricciones y criterios visuales explícitos. | Cómo cambia el resultado cuando el prompt explicita decisiones que antes eran implícitas. |
| [03-profesional/](./03-profesional) | Prompt de tipo "spec" con criterios de aceptación, arquitectura, restricciones de calidad y definition of done. | Lo que se puede esperar cuando el prompt funciona como contrato técnico. |

## Cómo comparar

Abrí los tres `index.html` en pestañas distintas y jugá un minuto cada uno. Después abrí los tres archivos en el editor y comparalos: estructura, separación de responsabilidades, manejo de estado, claridad. La diferencia entre `01-vago` y `03-profesional` no es de talento del agente; es de calidad del prompt.
