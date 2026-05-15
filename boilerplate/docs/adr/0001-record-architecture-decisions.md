# 0001 — Usar Architecture Decision Records en este proyecto

- **Status**: Accepted
- **Date**: 2026-05-15
- **Deciders**: equipo del proyecto

## Context

Este proyecto está diseñado para colaborar con un agente de IA desde el primer día. El agente no tiene memoria persistente entre sesiones: cada vez que abre el repo, lo único que sabe es lo que está escrito en disco.

Sin un mecanismo formal para capturar decisiones arquitectónicas, esas decisiones quedan dispersas en chats, en la cabeza de una persona o, peor, en commits con mensajes vagos. El resultado predecible es que el agente —y los humanos nuevos— las desconocen y las contradicen.

Se consideraron tres alternativas:

1. **No documentar decisiones arquitectónicas** y confiar en code review. Descartado: code review no escala con agentes que generan código rápido y no leen historial.
2. **Documentar en un único `ARCHITECTURE.md` monolítico.** Descartado: archivos largos terminan desactualizados en bloque y nadie sabe qué línea sigue vigente.
3. **ADRs**: un archivo corto, fechado, inmutable por decisión. Aceptado.

## Decision

Adoptamos **Architecture Decision Records (ADRs)** como mecanismo formal para documentar decisiones arquitectónicas relevantes.

- Una decisión por archivo, numerada secuencialmente.
- Estructura fija: Status, Context, Decision, Consequences.
- Inmutables: si una decisión cambia, se crea un ADR nuevo que supersede al anterior; el anterior queda en el repo como historia.
- Toda decisión que afecte la forma del sistema (lenguaje, framework, patrón de capas, persistencia, comunicación entre módulos, autenticación, etc.) requiere un ADR antes de implementarse.

La plantilla vive en [ADR_TEMPLATE.md](./ADR_TEMPLATE.md).

## Consequences

### Positivas

- El agente puede leer todos los ADRs al inicio de la sesión y operar dentro de las restricciones del proyecto sin tener que adivinar.
- Las decisiones quedan auditables: por qué se eligió X, qué se descartó, qué cambió.
- Las nuevas personas (humanas o no) se onboardean leyendo el directorio.

### Negativas o costos

- Disciplina: cada decisión relevante exige un archivo corto, no un commit suelto.
- Posible sobreuso al inicio: tentación de escribir ADRs para decisiones triviales.

### Riesgos / cosas a vigilar

- Que los ADRs se desactualicen sin que nadie escriba el ADR que supersede. Mitigación: convención de que cambiar una decisión arquitectónica sin ADR nuevo es motivo de rechazo en PR.
- Que se confundan ADRs con specs. Los ADRs documentan **decisiones sobre cómo se construye el sistema**; las specs documentan **qué hace una feature concreta**.
