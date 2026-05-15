# MEMORY_INDEX

Índice de memorias disponibles para el agente. **Se carga siempre al inicio de la sesión.**

Una línea por memoria, con tipo y un resumen de una línea. El detalle vive en cada archivo enlazado; el índice solo decide qué relevante leer.

## Convención de línea

```
- [<tipo>] [titulo-kebab.md](./titulo-kebab.md) — resumen de una línea en presente.
```

El `<tipo>` es uno de: `user`, `feedback`, `project`, `reference`.

## Entradas (rellenar al crear cada memoria)

Los siguientes son **ejemplos de formato**, no entradas vigentes. Reemplazalos por tus memorias reales y borrá esta nota.

```
- [user] [user.md](./user.md) — <<una_linea_sobre_quien_es_el_usuario>>.
- [feedback] [feedback-testing.md](./feedback-testing.md) — <<una_linea_sobre_la_correccion_o_validacion>>.
- [project] [project-deadline.md](./project-deadline.md) — <<una_linea_sobre_el_hito_o_decision>>.
- [reference] [reference-grafana.md](./reference-grafana.md) — <<una_linea_sobre_el_sistema_externo>>.
```

## Reglas para mantener el índice

- Si agregás una memoria nueva, agregá su línea acá.
- Si borrás una memoria, borrá su línea.
- Si una memoria cambia de propósito, actualizá el resumen.
- El índice no es memoria: es un mapa. No escribas contenido sustantivo acá.
- Si el índice crece más de 30 entradas, considerá consolidar memorias afines en una sola.
