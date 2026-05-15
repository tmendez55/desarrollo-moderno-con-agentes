# 03-profesional

Resultado del prompt de nivel profesional: especificación completa, con criterios de aceptación, restricciones de arquitectura, definición de calidad y definition of done.

## Prompt usado

Ver [`prompts_profesional.md`](../../../prompts_profesional.md) en la raíz del proyecto.

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

AQUÍ VA EL ARCHIVO `index.html` (pendiente de generar)
