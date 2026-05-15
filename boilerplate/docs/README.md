# docs/

Documentación viva del proyecto. Tres subcarpetas con propósitos distintos:

- [specs/](./specs) — Especificaciones de features. Una spec por funcionalidad relevante. Se escribe **antes** de implementar, sirve como contrato entre el humano que pide y el agente que implementa.
- [adr/](./adr) — Architecture Decision Records. Una decisión arquitectónica por archivo. Inmutable una vez aceptada: si la decisión cambia, se escribe un ADR nuevo que supersede al anterior, no se reescribe la historia.
- [process/](./process) — Convenciones del repo: branching, commits, pull requests.

## Regla general

Documentación que miente es peor que documentación que falta. Si un documento queda desactualizado, el agente lo va a tomar como verdad y va a romper cosas confiando en él. Mantener `docs/` al día es parte del trabajo de cada feature, no un paso aparte.
