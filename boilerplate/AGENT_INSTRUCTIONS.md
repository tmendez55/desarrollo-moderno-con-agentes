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

# Instrucciones para el agente — `<<NOMBRE_PROYECTO>>`

## 1. Project Overview

`<<NOMBRE_PROYECTO>>` es `<<UNA_O_DOS_LINEAS_DESCRIBIENDO_EL_PRODUCTO>>`. Sirve a `<<TIPO_DE_USUARIO>>` para resolver `<<PROBLEMA_PRINCIPAL>>`. La métrica que importa es `<<METRICA_DE_EXITO>>`.

Estado actual: `<<MVP | BETA | PRODUCCION>>`.

## 2. Stack & Versions

- Lenguaje principal: `<<LENGUAJE_Y_VERSION>>`
- Runtime / SDK: `<<RUNTIME_Y_VERSION>>`
- Framework principal: `<<FRAMEWORK_Y_VERSION>>`
- Base de datos: `<<DB_Y_VERSION>>`
- Gestor de paquetes: `<<PKG_MANAGER>>`
- Herramientas auxiliares: `<<LISTA_DE_TOOLING_LINTER_FORMATTER>>`

Versiones bloqueadas. Si necesitás cambiar una versión, abre un ADR antes.

## 3. Architecture

`<<UNO_O_DOS_PARRAFOS_DESCRIBIENDO_EL_DISENO>>`

Diagrama de capas:

```
<<DIAGRAMA_TEXTUAL_DE_LA_ARQUITECTURA>>
```

Regla de oro arquitectónica: `<<EJ_NUNCA_LLAMAR_INFRA_DESDE_DOMAIN>>`.

## 4. File Structure

```
<<NOMBRE_PROYECTO>>/
├── src/
│   └── modules/
│       └── <<modulo>>/
│           ├── domain/
│           ├── application/
│           └── infrastructure/
├── tests/
│   ├── unit/
│   ├── integration/
│   └── e2e/
├── docs/
└── memory/
```

`<<NOTAS_ESPECIFICAS_DE_TU_LAYOUT>>`

## 5. Commands

| Acción | Comando |
|---|---|
| Instalar dependencias | `<<COMANDO_INSTALL>>` |
| Lint | `<<COMANDO_LINT>>` |
| Tests | `<<COMANDO_TEST>>` |
| Build | `<<COMANDO_BUILD>>` |
| Run local | `<<COMANDO_RUN>>` |
| Type check | `<<COMANDO_TYPECHECK>>` |

Estos son los comandos canónicos. No inventes alternativas.

## 6. Coding Standards

- Indentación: `<<TABS_O_SPACES_Y_TAMANIO>>`.
- Naming: `<<CONVENCIONES_FILES_FUNCTIONS_VARS>>`.
- Tests: `<<UBICACION_Y_FORMATO>>`. Cada cambio funcional viene con su test.
- Comentarios: solo cuando el "por qué" no es obvio. Nombres claros antes que comentarios.
- Errores: `<<EJ_NUNCA_SWALLOW_LOGUEAR_O_PROPAGAR>>`.
- `<<OTRAS_REGLAS_DURAS_DE_ESTILO>>`.

## 7. Context Packs & Memory

Antes de tocar un módulo, leé su context pack en `memory/context-packs/<modulo>.md`. Si el módulo no tiene context pack, créalo a partir de la plantilla y proponé el contenido inicial; no avances con suposiciones.

La memoria del agente vive en `memory/agent-memory/` y **no se versiona**. Cuando aprendas algo útil sobre el usuario, el proyecto o el flujo de trabajo, proponé guardarlo allí en el archivo que corresponda (`user`, `feedback`, `project`, `reference`). El usuario aprueba.

La carpeta `memory/session/` está vacía a propósito. No persistas estado de sesión ahí.

## 8. Repo Conventions

- **Branching**: ver [docs/process/branching.md](./docs/process/branching.md).
- **Commits**: ver [docs/process/commits.md](./docs/process/commits.md). Conventional Commits obligatorio.
- **Pull Requests**: ver [docs/process/pull-requests.md](./docs/process/pull-requests.md). Hay un template en `.github/PULL_REQUEST_TEMPLATE.md`.
- **ADRs**: cada decisión arquitectónica relevante se documenta en `docs/adr/`. Plantilla en `ADR_TEMPLATE.md`.

## 9. Known Gotchas

- `<<GOTCHA_1_BREVE_DESCRIPCION_Y_COMO_LIDIAR>>`
- `<<GOTCHA_2>>`
- `<<GOTCHA_3>>`

Esta lista crece con el proyecto. Si encontrás algo no obvio, agregalo acá.

## 10. Working with This Agent

Reglas duras que el agente debe respetar siempre:

- **No mergea a `main`.** El agente nunca hace merge a `main`, ni siquiera con permisos. El merge a `main` requiere confirmación humana explícita y se hace por la interfaz del hosting (GitHub, GitLab, etc.).
- **No aplica cambios destructivos sin doble confirmación.** Borrar archivos, branches, tablas, recursos cloud, `rm -rf`, `git reset --hard`, force-push: todo eso requiere que el usuario confirme dos veces.
- **No instala dependencias nuevas sin avisar.** Agregar una dependencia es una decisión arquitectónica. Proponé primero, instalá después.
- **No commitea sin que el usuario lo pida.** Mostrar el diff, esperar revisión.
- **No inventa convenciones.** Si la información no está en este archivo, en los context packs o en los docs, preguntá antes de adivinar.
- **No avanza con información que sabe que está desactualizada.** Si detectás que algo en este archivo contradice el estado actual del repo, parar y avisar.
- **Trabaja siempre desde una branch feature/**, no sobre `main` ni sobre `dev` directamente.
- **Cierra el loop**: cuando termina una tarea, informa qué se hizo, qué quedó pendiente, y qué necesita validación humana.
