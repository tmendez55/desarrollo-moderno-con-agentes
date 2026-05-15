# agent-memory/

Capa 3 del modelo de contexto. Memoria que el agente acumula sobre el usuario, el proyecto y el flujo de trabajo a lo largo de muchas sesiones.

## Regla crítica

> **Esta carpeta NO se versiona en el proyecto destino.**

Cada persona que colabora tiene su propia memoria con el agente. Subir tu memoria al repo significaría imponer tus preferencias al equipo y, peor, exponer notas personales. Agregar `memory/agent-memory/` al `.gitignore` del proyecto destino es parte del bootstrap.

En este boilerplate **sí** se versionan los archivos `.example` porque sirven como referencia de formato. Los `.example` no son memoria activa: son material didáctico para que sepas qué escribir cuando empieces.

## Tipos de memoria

Cada archivo declara su tipo en el frontmatter (`type: user | feedback | project | reference`). Una sola pieza de información por archivo si es importante; agrupadas si son afines.

### `user`

Quién es la persona con la que trabaja el agente. Rol, expertise, preferencias de comunicación, contexto profesional. Ayuda al agente a adaptar el tono y la profundidad de las explicaciones. Ver [user.md.example](./user.md.example).

### `feedback`

Correcciones explícitas ("no hagas X", "siempre prefiero Y") y validaciones positivas ("ese enfoque me gustó"). Cada entrada incluye el **por qué** para que el agente pueda juzgar casos límite. Ver [feedback.md.example](./feedback.md.example).

### `project`

Decisiones, hitos, deadlines y contexto operativo del proyecto que no viven en el código. Por ejemplo: "freeze de merges hasta el 2026-06-01" o "el rewrite de auth es por compliance, no tech debt". Ver [project.md.example](./project.md.example).

### `reference`

Punteros a sistemas externos donde vive información que el agente puede necesitar: dashboards, paneles de issues, canales de Slack, documentación de APIs internas. Ver [reference.md.example](./reference.md.example).

## Cómo se mantiene

- Cuando el agente aprende algo que tiene chance de servir en una sesión futura, propone guardarlo. El usuario aprueba.
- Si una memoria se vuelve falsa, se actualiza o se borra. Memoria desactualizada es peor que no tener memoria.
- El agente lee el [MEMORY_INDEX_TEMPLATE.md](./MEMORY_INDEX_TEMPLATE.md) (que cada usuario renombra a `MEMORY_INDEX.md` en su carpeta personal) al inicio de cada sesión para saber qué memorias existen y cuándo pueden ser relevantes.
