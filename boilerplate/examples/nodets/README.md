# Ejemplo Node/TypeScript

Una instancia mínima y funcional del boilerplate, en TypeScript con runtime de Node 20+. Sirve para ver cómo se ve el sistema de cuatro capas cuando se materializa en un stack concreto.

## Qué hace este código

Expone un módulo `greeter` con una función `greet(name, lang?)` que devuelve un objeto `Greeting`. El entry point CLI (`src/index.ts`) lo invoca con argumentos pasados desde la terminal.

```bash
$ npm start
Hola, mundo.

$ npm start -- Marta
Hola, Marta.

$ npm start -- Marta en
Hello, Marta.
```

No hace nada más. La gracia no es la funcionalidad; la gracia es el **andamiaje a su alrededor**.

## Cómo correrlo

Requisitos: Node 20.6 o superior, npm.

```bash
cd boilerplate/examples/nodets
npm install
npm test
npm start -- Marta
```

`npm test` corre primero un `tsc --noEmit` (type-check) y después los tests con `node --test`. Si el código no tipo-checkea, los tests fallan antes de correr; es a propósito.

## Qué partes del boilerplate ilustra

| Capa / artefacto | Dónde está en este ejemplo |
|---|---|
| Capa 1 — instrucciones del proyecto | [AGENT_INSTRUCTIONS.md](./AGENT_INSTRUCTIONS.md) rellenado completo, sin placeholders. |
| Capa 2 — context packs | [memory/context-packs/greeter.md](./memory/context-packs/greeter.md). |
| Capa 3 — agent memory | No incluida a propósito (es privada por usuario). El boilerplate raíz tiene los `.example`. |
| Capa 4 — session | No incluida (vive en memoria del agente). |
| ADRs | [docs/adr/0001-record-architecture-decisions.md](./docs/adr/0001-record-architecture-decisions.md). |
| Tests al lado del código | `src/modules/greeter/greeter.test.ts`. |
| Módulos con boundary | `src/modules/greeter/index.ts` como única superficie pública. |

## Cómo expandirlo

Si querés convertir esto en un proyecto real, los siguientes pasos razonables son:

1. **Agregar un módulo nuevo** copiando la estructura de `greeter/`. Crear su context pack en `memory/context-packs/<modulo>.md`.
2. **Introducir capas** (`domain/`, `application/`, `infrastructure/`) cuando el módulo necesite estado o IO. Documentar el cambio con un ADR.
3. **Agregar `tests/integration/`** cuando haya cruces entre módulos. Mantener los unit tests al lado del código.
4. **Activar memoria del agente** copiando `memory/agent-memory/` del boilerplate raíz y agregándolo al `.gitignore`.
5. **Configurar CI** renombrando `boilerplate/.github/workflows/ci.yml.example` a `.github/workflows/ci.yml` en la raíz del proyecto y descomentando los steps que apliquen.

## Decisiones que verás reflejadas en el código

- **`node:test` en lugar de Jest**: cero dependencias de testing externas. Ver [ADR-0001](./docs/adr/0001-record-architecture-decisions.md).
- **`tsx` solo para desarrollo y tests**: el build de producción es `tsc` puro. `tsx` no aparece en la output.
- **Imports relativos con extensión `.js`**: porque el output es ESM y Node ESM exige extensión.
- **`strict: true` total en TypeScript**, sin excepciones. Si algo no compila con strict, se corrige el código, no la config.
