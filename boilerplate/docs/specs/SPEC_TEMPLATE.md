# Spec — `<<NOMBRE_FEATURE>>`

- **ID**: `NNNN`
- **Status**: Draft | En revisión | Aprobada | Implementada | Obsoleta
- **Autor**: `<<TU_NOMBRE>>`
- **Fecha**: `YYYY-MM-DD`
- **Módulo afectado**: `<<modulo>>`
- **PR relacionado**: `<<URL_PR>>` (rellenar al cerrar)

## 1. Contexto de negocio

`<<UNO_O_DOS_PARRAFOS_RESPONDIENDO_POR_QUE_AHORA>>`

- ¿Qué problema concreto resuelve esta feature?
- ¿Qué pasa si no la hacemos?
- ¿A quién le importa?

## 2. Criterios de aceptación

Formato user story + Given/When/Then.

### Historia principal

> **As a** `<<TIPO_DE_USUARIO>>`
> **I want** `<<CAPACIDAD>>`
> **So that** `<<RESULTADO_DE_VALOR>>`

### Escenarios

**Escenario 1 — Camino feliz**

```
Given <<estado_inicial>>
When <<accion_del_usuario>>
Then <<resultado_observable>>
And <<efecto_secundario_si_aplica>>
```

**Escenario 2 — `<<NOMBRE_DEL_ESCENARIO>>`**

```
Given <<...>>
When <<...>>
Then <<...>>
```

## 3. Escenarios edge

- `<<EDGE_1>>`: qué pasa cuando `<<...>>`.
- `<<EDGE_2>>`: qué pasa cuando `<<...>>`.
- `<<EDGE_3>>`: qué pasa cuando `<<...>>`.

Si un edge case no está aquí pero existe, el comportamiento queda indefinido y el agente puede tomar la decisión que prefiera.

## 4. Notas técnicas

- **Endpoints / contratos**: `<<DETALLE>>`.
- **Cambios de schema**: `<<DETALLE>>`.
- **Eventos emitidos / consumidos**: `<<DETALLE>>`.
- **Dependencias nuevas**: `<<NINGUNA_O_LISTA>>` (si hay, abre ADR).
- **Decisiones que se delegan al agente**: `<<LISTA_O_NINGUNA>>`.

## 5. Definition of Done

- [ ] Implementación cubre todos los escenarios listados.
- [ ] Tests unitarios para la lógica nueva.
- [ ] Tests de integración para los cruces con otros módulos.
- [ ] Context pack del módulo actualizado.
- [ ] Documentación de proceso actualizada si cambia un flujo.
- [ ] ADR creado si la implementación introdujo una decisión arquitectónica.
- [ ] PR linkeado a esta spec.
- [ ] Lint y type-check pasan.
- [ ] Revisión humana aprobada.
