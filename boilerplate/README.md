# boilerplate

Plantilla agnóstica al lenguaje para empezar un proyecto de software diseñado para colaborar con un agente de IA desde el primer día.

## Principio rector

> **Tu agente tiene amnesia perfecta entre sesiones.**

Cada vez que el agente abre el repositorio empieza desde cero. No recuerda la conversación de ayer, no sabe qué intentó la otra instancia que corrió en paralelo, no infiere convenciones que no estén escritas. Lo único que tiene es lo que esté en disco.

De ahí sale la regla operativa:

> **Lo que no está escrito, no existe.**

Si una convención vive solo en tu cabeza, el agente la va a romper. Si una decisión arquitectónica no quedó en un ADR, el agente la va a contradecir. Si un módulo no tiene su contexto documentado, el agente lo va a reinventar mal. El boilerplate está diseñado para que escribir lo importante sea fácil y olvidarlo, difícil.

## Las cuatro capas de contexto

Este boilerplate materializa un modelo de cuatro capas que separa qué tipo de información vive dónde.

### Capa 1 — Instrucciones del proyecto

Archivo: [`AGENT_INSTRUCTIONS.md`](./AGENT_INSTRUCTIONS.md).

Es el contrato entre el agente y el proyecto. Define el stack, la arquitectura, los comandos canónicos, las convenciones de commit y branching, los gotchas, y las reglas duras que el agente debe respetar. Se lee al inicio de cada sesión. Cambia cuando cambia el proyecto, no entre tareas.

### Capa 2 — Conocimiento por módulo

Carpeta: [`memory/context-packs/`](./memory/context-packs).

Un archivo por módulo del sistema, con su propósito, entidades de dominio, casos de uso, APIs, eventos y errores conocidos. Permite al agente trabajar profundamente en un módulo sin tener que leer todo el repositorio. Vive en el repo, se versiona, se mantiene como parte del trabajo normal.

### Capa 3 — Memoria del agente

Carpeta: [`memory/agent-memory/`](./memory/agent-memory).

Información que el agente acumula sobre el usuario, sobre el proyecto y sobre el flujo de trabajo a lo largo de muchas sesiones. **No se versiona en el proyecto destino**: cada persona tiene la suya. En este boilerplate hay archivos `.example` para mostrar el formato y los tipos (`user`, `feedback`, `project`, `reference`).

### Capa 4 — Sesión actual

Carpeta: [`memory/session/`](./memory/session).

La conversación en curso, los archivos abiertos, los resultados de los últimos tool calls. Vive en memoria del agente durante la sesión y se descarta al cerrar. **La carpeta existe vacía a propósito**: es un recordatorio de que no hay que persistir contexto efímero en disco.

## Cómo empezar

Ver [QUICKSTART.md](./QUICKSTART.md) para la guía paso a paso.

## Estructura

```
boilerplate/
├── AGENT_INSTRUCTIONS.md      Capa 1 (plantilla a rellenar)
├── QUICKSTART.md
├── docs/
│   ├── specs/                 Plantilla de spec de feature
│   ├── adr/                   Architecture Decision Records
│   └── process/               Branching, commits, PRs
├── memory/
│   ├── context-packs/         Capa 2 (por módulo)
│   ├── agent-memory/          Capa 3 (NO versionar en tu proyecto)
│   └── session/               Capa 4 (vacía a propósito)
├── src/                       Código del proyecto
├── tests/
├── scripts/
│   └── bootstrap.sh           Inicializa un proyecto nuevo
├── .github/
└── examples/
    └── nodets/                Ejemplo aplicado en Node/TypeScript
```

## Anti-patrones que matan la escalabilidad

Cuatro patrones recurrentes que destruyen la colaboración con agentes a mediano plazo. Cada uno aparece inocente, se asienta sin que nadie lo cuestione, y dos meses después el sistema está roto y nadie sabe por qué.

### 1. Memoria como log de actividad

Usar la memoria del agente para registrar todo lo que pasó en cada sesión: "el martes hice X, el miércoles hice Y, el jueves discutimos Z". El archivo crece sin freno, las entradas viejas contradicen a las nuevas, y el agente termina cargando ruido en lugar de señal.

> **Regla de oro:** La memoria es para lo que va a ser cierto en futuras sesiones, no para lo que pasó en esta. Si lo que escribís no va a ayudar al agente la próxima vez, no es memoria: es un diario, y el diario va en otra parte (o en ningún lado).

### 2. Documentación que miente

Documentación que existió, dejó de ser cierta y no se actualizó. El agente la lee como verdad y construye encima decisiones falsas. El daño es peor que no tener documentación, porque el agente confía y nadie lo cuestiona.

> **Regla de oro:** Documentación desactualizada se borra o se corrige; no se ignora. Cada PR que cambia comportamiento revisa los context packs, ADRs y specs afectados. La documentación es parte del cambio, no un paso opcional posterior.

### 3. Agente con permisos en `main`

Darle al agente capacidad técnica de mergear a `main`, hacer force push, borrar branches compartidas o tocar producción directamente. El agente es rápido y eficiente: rápida y eficientemente puede romper producción sin nadie en el medio.

> **Regla de oro:** El agente nunca mergea a `main`. Ni con permisos, ni "solo esta vez", ni para arreglar lo que acabó de romper. El merge a `main` es un acto de responsabilidad humana firmado por una persona.

### 4. Trabajo sin issue

Tareas que el agente ejecuta sin que exista un issue, spec o ticket que las explique. Cuando algo sale mal, no hay rastro de quién pidió qué ni con qué criterio. Cuando algo sale bien, tampoco: el trabajo queda invisible en el chat y no informa decisiones futuras.

> **Regla de oro:** Cada cambio mergeable apunta a un issue, una spec o un ADR. Si no se puede linkear, probablemente no debía hacerse, o debía discutirse antes. El historial del proyecto vive en commits **y** en issues, no solo en uno.

