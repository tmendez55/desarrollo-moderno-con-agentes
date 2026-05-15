# 0001 — Usar `node:test` en lugar de Jest para los tests de este ejemplo

- **Status**: Accepted
- **Date**: 2026-05-15
- **Deciders**: autores del boilerplate

## Context

Este ejemplo existe para mostrar el boilerplate aplicado a Node/TypeScript con el menor andamiaje posible. Cada dependencia que se agrega tiene dos costos: hincha el `package.json` (y por lo tanto el resultado de `npm install`) y obliga a quien aprende del ejemplo a entender una herramienta más.

Se consideraron tres alternativas para correr los tests:

1. **Jest**. Maduro, popular, ampliamente conocido. Trae un mocker, snapshots, transformación TS opcional y un runner propio. **Costo**: arrastra decenas de dependencias transitivas, requiere configuración específica para TypeScript ESM (que sigue siendo un punto de fricción), y el mensaje del ejemplo deja de ser "Node + TS" y pasa a ser "Node + TS + Jest".
2. **Vitest**. Más liviano que Jest, API casi compatible. **Costo**: dependencia adicional con su propia configuración. Para un ejemplo de tres tests sigue siendo más de lo que hace falta.
3. **`node:test` (built-in en Node 18+)**. Cero dependencias para testing. API minimalista pero suficiente: `describe`, `it`, `before`, `after`. Se integra con `assert` (también built-in).

## Decision

Usamos **`node:test`** como test runner único de este ejemplo.

- Tests se ubican al lado del código fuente, sufijo `.test.ts`.
- El script `npm test` corre primero `tsc --noEmit` (type-check) y después `node --import tsx --test 'src/**/*.test.ts'`.
- `tsx` se usa **solo** como import loader para que Node ejecute `.ts` sin transpilación previa; no es framework de tests.

## Consequences

### Positivas

- El `package.json` queda con apenas tres devDependencies (`typescript`, `tsx`, `@types/node`). El `npm install` es rápido y reproducible.
- Quien lea el ejemplo entiende qué hace cada herramienta sin tener que aprender la idiosincrasia de Jest.
- El comportamiento de los tests no depende de un transformador propio: lo que ves es lo que Node ejecuta.

### Negativas o costos

- `node:test` no trae mocker integrado. Si un módulo del ejemplo crece y necesita mockear dependencias, hay que armar fakes a mano o aceptar la dependencia adicional. Para el alcance actual no es un problema.
- API menos rica que Jest (no hay matchers tipo `expect(x).toHaveBeenCalledWith(...)`). Se compensa con `assert` y con la decisión de mantener los tests simples.
- Quien venga acostumbrado a Jest puede sentir fricción al adaptar la sintaxis.

### Riesgos / cosas a vigilar

- Si el proyecto crece y los tests empiezan a necesitar features que `node:test` no cubre (snapshot testing, watch mode sofisticado, paralelización agresiva), corresponde escribir un ADR que supersede a este recomendando Vitest u otro runner.
- `node --import tsx` exige Node 20.6+. Versiones anteriores requieren `--loader tsx`, que está deprecado y emite warnings. La versión mínima de Node está bloqueada en `package.json > engines`.
