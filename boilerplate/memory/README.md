# memory/

Materializa las capas 2, 3 y 4 del modelo de contexto.

## Las tres subcarpetas

### [context-packs/](./context-packs) — Capa 2

Conocimiento por módulo. Un archivo por módulo del sistema, con propósito, entidades, casos de uso, APIs, eventos, errores conocidos. **Se versiona** en el repo: forma parte del proyecto. Mantenelo al día como parte del trabajo de cada feature.

Plantilla: [CONTEXT_PACK_TEMPLATE.md](./context-packs/CONTEXT_PACK_TEMPLATE.md).

### [agent-memory/](./agent-memory) — Capa 3

Memoria que el agente acumula sobre el usuario, sobre el proyecto y sobre el flujo de trabajo, a lo largo de muchas sesiones. Cuatro tipos: `user`, `feedback`, `project`, `reference`.

> **Regla crítica: `memory/agent-memory/` NO se versiona en el proyecto destino.**
> Cada persona tiene su propia memoria con el agente. Agregar `memory/agent-memory/` al `.gitignore` del proyecto destino es parte del bootstrap.

En este boilerplate sí se versionan los archivos `.example`, porque sirven como referencia de formato. Los `.example` no se cargan en sesión real: son material didáctico.

### [session/](./session) — Capa 4

Sesión actual. **Vacía a propósito.** Existe como recordatorio explícito: la información de sesión (conversación en curso, archivos abiertos, resultados de tool calls recientes) vive en la memoria del agente durante la sesión y se descarta al cerrar. No se persiste en disco.

## Cómo se relacionan las capas

```
┌─────────────────────────────────────────────────────────┐
│ Capa 1 — AGENT_INSTRUCTIONS.md (raíz del proyecto)      │
│ Contrato estable. Cambia con el proyecto.               │
├─────────────────────────────────────────────────────────┤
│ Capa 2 — memory/context-packs/                          │
│ Conocimiento por módulo. Cambia con el módulo.          │
├─────────────────────────────────────────────────────────┤
│ Capa 3 — memory/agent-memory/  (NO versionada)          │
│ Memoria entre sesiones. Cambia con la persona.          │
├─────────────────────────────────────────────────────────┤
│ Capa 4 — memory/session/  (vacía a propósito)           │
│ Conversación viva. Se descarta al cerrar.               │
└─────────────────────────────────────────────────────────┘
```

Cada capa responde a una pregunta distinta:

- **Capa 1**: ¿qué es este proyecto y cómo se trabaja en él?
- **Capa 2**: ¿qué hace este módulo en particular?
- **Capa 3**: ¿qué aprendí sobre cómo le gusta trabajar a esta persona?
- **Capa 4**: ¿qué estamos haciendo ahora mismo?

Si confundís capas, el sistema se rompe: memoria de sesión en Capa 1 hincha las instrucciones; preferencias personales en Capa 2 ensucian el conocimiento del módulo; decisiones del proyecto en Capa 3 las pierde la próxima persona.
