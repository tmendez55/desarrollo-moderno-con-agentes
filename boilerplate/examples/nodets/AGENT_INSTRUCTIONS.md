<!--
==================================================================
CONTRATO ENTRE EL AGENTE Y ESTE PROYECTO
==================================================================
Este archivo es el contrato entre el agente y este proyecto.
Léelo completo al inicio de cada sesión. Si algo aquí está
incorrecto o incompleto, díselo al usuario y propon un cambio.
No avances con información que sabes que está desactualizada.
==================================================================
-->

# Instrucciones para el agente — boilerplate-nodets-example

## 1. Project Overview

`boilerplate-nodets-example` es un proyecto minimal en Node + TypeScript que sirve como demostración aplicada del boilerplate de la charla. Su única función pública es un módulo `greeter` que produce saludos en español o inglés. No tiene clientes reales: existe para mostrar cómo se ve el boilerplate cuando se instancia en un stack concreto.

Estado actual: ejemplo didáctico, no producto.

## 2. Stack & Versions

- Lenguaje principal: TypeScript 5.4+
- Runtime: Node.js 20.6+ (necesario por `--import`)
- Test runner: `node:test` (built-in, sin dependencias externas)
- Loader TS: `tsx` (solo para desarrollo / tests; no se usa en build)
- Gestor de paquetes: npm
- Sin frameworks de aplicación, sin DB, sin red.

Versiones bloqueadas en `package.json`. Si necesitás cambiar una versión mayor (Node 22, TypeScript 6, etc.), abre un ADR antes.

## 3. Architecture

Una única capa de aplicación pequeña organizada por módulo. Cada módulo expone una API pública mediante su archivo `index.ts`; el código interno del módulo no se importa desde afuera.

```
src/
├── index.ts                Entry point CLI.
└── modules/
    └── greeter/
        ├── index.ts        API pública del módulo.
        ├── greeter.ts      Implementación.
        └── greeter.test.ts Tests con node:test.
```

Como el ejemplo es chico, no se subdivide cada módulo en `domain/`, `application/`, `infrastructure/`. Esa subdivisión vale la pena cuando los módulos tienen estado y dependencias externas; acá serían carpetas vacías y agregar ceremonia sin valor. **Cuando este ejemplo crezca y un módulo necesite IO, sí corresponde introducir la separación**.

Regla de oro arquitectónica: el código fuera de un módulo solo puede importar desde el `index.ts` de ese módulo, nunca desde rutas internas.

## 4. File Structure

```
boilerplate-nodets-example/
├── AGENT_INSTRUCTIONS.md    Este archivo.
├── README.md                Cómo correr el ejemplo.
├── package.json
├── tsconfig.json
├── .eslintrc.json
├── src/
│   ├── index.ts
│   └── modules/
│       └── greeter/
│           ├── index.ts
│           ├── greeter.ts
│           └── greeter.test.ts
├── memory/
│   └── context-packs/
│       └── greeter.md       Context pack del módulo greeter.
└── docs/
    └── adr/
        └── 0001-record-architecture-decisions.md
```

Notas:

- No hay `tests/` separado; los tests viven al lado del código (`*.test.ts`). Para un ejemplo de este tamaño, conviven mejor con el módulo. En proyectos reales con tests de integración o e2e, vale la pena el `tests/` dedicado.
- No hay `memory/agent-memory/` ni `memory/session/`. El ejemplo solo materializa la **Capa 2** (context-packs). Las otras capas viven en el boilerplate raíz.

## 5. Commands

| Acción | Comando |
|---|---|
| Instalar dependencias | `npm install` |
| Lint (type-check) | `npm run lint` |
| Tests | `npm test` |
| Build a JS | `npm run build` |
| Run local | `npm start` (saludo por defecto), `npm start -- Marta en` (saluda a Marta en inglés) |

Estos son los comandos canónicos. No inventes alternativas.

## 6. Coding Standards

- Indentación: 2 espacios, sin tabs.
- Naming: archivos en `kebab-case` (o `camelCase` cuando coincide con el símbolo principal exportado, como `greeter.ts`); tipos e interfaces en `PascalCase`; funciones y variables en `camelCase`.
- Tests: al lado del código, sufijo `.test.ts`. Cada cambio funcional viene con su test.
- Comentarios: solo cuando el "por qué" no es obvio. Nombres claros antes que comentarios.
- Errores: lanzar `Error` con mensaje accionable. Nunca tragar errores con `catch` vacío.
- Imports relativos llevan extensión `.js` (no `.ts`), porque el target es Node ESM y `tsc` no reescribe rutas.
- `strict: true` en TypeScript es no-negociable. Si algo no compila con strict, se corrige; no se relaja la configuración.

## 7. Context Packs & Memory

Antes de tocar el módulo `greeter`, leé [memory/context-packs/greeter.md](./memory/context-packs/greeter.md). Si agregás un módulo nuevo, creale su context pack a partir de la plantilla del boilerplate raíz.

Este ejemplo no incluye `memory/agent-memory/` ni `memory/session/`. Si querés activar memoria del agente, copiá las carpetas correspondientes del boilerplate raíz y agregalas al `.gitignore` de este proyecto.

## 8. Repo Conventions

- **Branching**: ver [../../docs/process/branching.md](../../docs/process/branching.md).
- **Commits**: Conventional Commits. Ver [../../docs/process/commits.md](../../docs/process/commits.md).
- **Pull Requests**: ver [../../docs/process/pull-requests.md](../../docs/process/pull-requests.md).
- **ADRs**: cada decisión arquitectónica relevante en `docs/adr/`. Hay un ADR-0001 ya escrito explicando por qué se eligió `node:test` en lugar de Jest.

## 9. Known Gotchas

- **Imports con `.js`**: porque el output de `tsc` es ESM real y Node ESM requiere extensión explícita. No quitar la `.js` aunque el editor sugiera hacerlo. Esto es lo correcto, no un bug.
- **`node --import tsx`** (no `--loader tsx`): el `--loader` está deprecado en Node 20+. Usar siempre `--import`.
- **`node:test` necesita Node 20.6+** para el flag `--test` en este modo. Versiones más viejas requieren otra invocación.
- **El `tsc --noEmit` corre como parte de `npm test` y `npm run lint`**: si el código no tipo-checkea, los tests fallan antes de correr. Es a propósito.

## 10. Working with This Agent

Reglas duras que el agente debe respetar siempre:

- **No mergea a `main`.** Ni siquiera en este ejemplo. El merge es responsabilidad humana.
- **No aplica cambios destructivos sin doble confirmación.** Borrar archivos, branches, recursos, `rm -rf`, `git reset --hard`, force-push: todo eso requiere confirmación explícita del usuario.
- **No instala dependencias nuevas sin avisar.** Este ejemplo está calibrado a propósito en *tres* devDependencies. Sumar Jest, Mocha, Vitest, dotenv, lodash, etc. sin discusión rompe la intención didáctica del ejemplo.
- **No commitea sin que el usuario lo pida.** Mostrar el diff, esperar revisión.
- **No inventa convenciones.** Si la información no está en este archivo, en el context pack del módulo o en los ADRs, preguntar antes de adivinar.
- **No avanza con información que sabe que está desactualizada.** Si detectás que algo en este archivo contradice el estado actual del repo, parar y avisar.
- **Trabaja siempre desde una branch feature/**, no sobre `main` ni sobre `dev` directamente.
- **Cierra el loop**: cuando termina una tarea, informa qué se hizo, qué quedó pendiente, y qué necesita validación humana.
