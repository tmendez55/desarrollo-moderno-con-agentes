# 02-mejorado

Resultado de un prompt estructurado donde el humano explicita las mecánicas, las restricciones técnicas y los criterios visuales antes de pedir el código.

## Prompt usado

```
Crea un juego en HTML, CSS y JavaScript puro (un solo archivo, sin
frameworks) donde:
- El jugador arrastra una resortera para lanzar un proyectil circular
- Hay gravedad y trayectoria parabólica
- Hay 3 estructuras hechas de bloques rectangulares a la derecha
- El objetivo es derribar los bloques con el menor número de lanzamientos
- Muestra contador de lanzamientos y bloques derribados
- Colores planos, estilo minimalista
```

## Qué se espera del resultado

- Mismas restricciones técnicas que la versión vaga (un archivo, sin frameworks) pero ahora **explícitas**.
- Mecánica clara: arrastrar para apuntar y soltar para disparar, con física parabólica visible.
- Tres estructuras de bloques, no inventadas, sino especificadas.
- UI mínima con dos contadores: lanzamientos hechos y bloques caídos.
- Estética coherente con la indicación "colores planos, minimalista".

## Qué observar en la comparación

- Menos decisiones arbitrarias del agente respecto a la versión vaga.
- Código más alineado con la intención del humano porque la intención fue declarada.
- Pero todavía pueden faltar: arquitectura clara, separación de capas, testing, manejo de edge cases. El prompt mejoró la "qué" pero no entró en "cómo".

## Archivo

AQUÍ VA EL ARCHIVO `index.html` (pendiente de generar)
