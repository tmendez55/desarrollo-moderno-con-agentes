# 01-vago

Resultado de un prompt vago, informal y ambiguo. Sirve como línea base: lo que pasa cuando se delega a la intuición del agente todo lo que el humano no quiso pensar.

## Prompt usado

```
hazme un juego tipo angry birds en html que sea divertido y que funcione bien
```

## Qué se espera del resultado

- Un único archivo `index.html` jugable.
- Decisiones tomadas por el agente sin guía: tema visual, mecánica concreta, número de niveles, qué significa "divertido" y "funcionar bien".
- Probablemente: gráficos genéricos hechos con primitivas de canvas, físicas simplificadas, niveles pocos y poco balanceados, código en un solo bloque sin separación clara.
- Es esperable que sea jugable pero tosco. Esa es la lección.

## Qué observar en la comparación

- Cuánto tiempo te lleva entender el código a primera vista.
- Cuántas decisiones implícitas tomó el agente que vos no pensaste cuando escribiste el prompt.
- Qué tan robusto es: qué pasa si arrastrás muy fuerte, si tocás los bordes, si los proyectiles se quedan trabados.

## Archivo

Ver [`index.html`](./index.html) en esta misma carpeta.
