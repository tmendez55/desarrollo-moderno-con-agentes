# examples/

Esta carpeta contiene **resultados reales producidos por un agente** a partir de prompts de distinta calidad, para usarlos como material de comparación durante la charla.

## Qué hay aquí

- [angry-game/](./angry-game): tres versiones del mismo proyecto —un juego web tipo resortera— generadas con tres prompts: uno vago, uno mejorado y uno profesional. Cada subcarpeta documenta el prompt usado y conserva el `index.html` tal cual lo entregó el agente, sin retoques manuales.

## Qué NO hay aquí

- No hay análisis comparativo escrito; ese se hace en vivo durante la charla.
- No hay variantes "limpias" o corregidas a mano. Los `index.html` son crudos, con sus defectos. Esa es la gracia.
- No hay otros ejemplos fuera del juego de resortera. Si más adelante se agregan, deben seguir la misma convención: una carpeta por proyecto, subcarpetas numeradas por calidad de prompt.

## Cómo se usan

Abrí cada `index.html` directamente en el navegador (no requieren servidor). Compará jugabilidad, físicas, estructura del código y prolijidad del resultado. Leé los `README.md` de cada subcarpeta para ver el prompt exacto que generó cada versión.
