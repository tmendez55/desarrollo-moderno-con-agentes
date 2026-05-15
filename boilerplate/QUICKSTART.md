# QUICKSTART

Guía paso a paso para empezar un proyecto nuevo usando este boilerplate.

## 1. Copiá el boilerplate a tu nuevo proyecto

```bash
cp -R /ruta/al/boilerplate /ruta/a/tu-proyecto-nuevo
cd /ruta/a/tu-proyecto-nuevo
```

No clones el repo de la charla y trabajes encima: hacé una copia limpia para que la historia de git del boilerplate no contamine tu proyecto.

## 2. Corré el bootstrap

```bash
bash scripts/bootstrap.sh
```

El script te va a preguntar el nombre del proyecto, reemplazar los placeholders `<<NOMBRE_PROYECTO>>` en los archivos, decidir si `memory/agent-memory/` queda fuera del repo o en el `.gitignore`, y crear un git nuevo.

## 3. Rellená `AGENT_INSTRUCTIONS.md`

Abrí [AGENT_INSTRUCTIONS.md](./AGENT_INSTRUCTIONS.md) y reemplazá cada placeholder `<<MARCADO_ASI>>` con la información real de tu proyecto: stack, comandos, arquitectura, convenciones. **No dejes placeholders sin rellenar**: un agente que lee `<<STACK>>` no entiende el contexto y va a inventar.

## 4. Documentá tu primera decisión arquitectónica

```bash
cp docs/adr/ADR_TEMPLATE.md docs/adr/0002-tu-decision.md
```

Editá el archivo con la decisión real (qué framework, qué base de datos, qué patrón de capas). Cada decisión que tomás antes de escribir código merece un ADR; cada decisión que evita preguntas futuras se paga sola.

## 5. Creá un primer context pack

Cuando agregues tu primer módulo bajo `src/`, copiá la plantilla:

```bash
cp memory/context-packs/CONTEXT_PACK_TEMPLATE.md memory/context-packs/<modulo>.md
```

Rellenalo con propósito, entidades, casos de uso. Mantenelo al día como parte del trabajo de cada feature, no como un paso aparte.

## 6. Configurá el CI

```bash
mv .github/workflows/ci.yml.example .github/workflows/ci.yml
```

Editá los steps de lint/test/build para que coincidan con tu stack.

## 7. Abrí tu agente sobre el repo

Abrí tu agente en el directorio del proyecto y empezá una conversación. El agente leerá automáticamente `AGENT_INSTRUCTIONS.md` al inicio. Si todo está bien rellenado, debería poder responder preguntas como "¿cuál es el comando para correr los tests?" sin pedirte aclaraciones.

> **Nota sobre el nombre del archivo:** distintas herramientas esperan archivos con nombres distintos (`CLAUDE.md`, `AGENTS.md`, `.cursorrules`, etc.). El contenido del archivo es lo que importa, no el nombre. Si tu agente requiere un archivo con otro nombre, creá un symlink o renombralo. El bootstrap te va a preguntar por esto.
