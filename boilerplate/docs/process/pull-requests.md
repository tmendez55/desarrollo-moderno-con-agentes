# Pull Requests

Toda integración a `dev` o `main` pasa por un PR. No se hace push directo, ni siquiera para "un cambio chiquito".

## Criterios para un PR mergeable

Un PR está listo para merge cuando cumple **todos** los puntos:

- [ ] Tiene título en formato Conventional Commits (`feat(scope): ...`).
- [ ] Linkea a la spec o al issue que originó el trabajo.
- [ ] Lint y tests pasan en CI.
- [ ] Type check pasa, si aplica.
- [ ] Los context packs de los módulos afectados quedaron actualizados en este mismo PR.
- [ ] Si introdujo una decisión arquitectónica, hay un ADR en el mismo PR.
- [ ] Tiene al menos un humano revisor que aprobó.
- [ ] No hay TODOs ni `console.log` ni imports muertos.
- [ ] El diff es lo más chico posible para revisar (idealmente < 400 líneas; si no, justificalo en la descripción).

Hay un template en [`.github/PULL_REQUEST_TEMPLATE.md`](../../.github/PULL_REQUEST_TEMPLATE.md) que materializa este checklist.

## Reglas de review

- Quien revisa **no** es quien escribió. Si el agente abrió el PR, el humano revisa.
- Revisar significa entender, no solo aprobar. Si no entendés un cambio, pedile al agente que lo explique en el PR.
- Comentarios accionables, no opiniones genéricas. "Esto está mal" sin contraejemplo no cuenta.
- Discusiones largas se resuelven en sincrónico y se resumen en el PR.

## Reglas duras

> **El agente nunca mergea a `main`.**

Esto vale aunque el agente tenga permisos técnicos para hacerlo. El merge a `main` es un acto de responsabilidad humana: alguien firma que el código va a producción.

- El agente puede mergear de `feature/` a `dev` solo si el PR tuvo review humano.
- El agente nunca hace `git push --force` a ramas compartidas.
- El agente nunca borra un PR ni descarta cambios sin aprobación explícita.
