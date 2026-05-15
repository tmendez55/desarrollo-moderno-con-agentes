<!--
Plantilla de Pull Request para <<NOMBRE_PROYECTO>>.
Llenala antes de pedir review. Los checks que no apliquen, márcalos
explícitamente como N/A; no los borres.
-->

## Resumen

Una o dos líneas describiendo qué hace este PR y por qué.

## Spec / Issue

- Spec: `docs/specs/NNNN-...md` (o N/A si es un cambio que no merece spec).
- Issue: `#NNN` (si aplica).

## Tipo de cambio

- [ ] feat — funcionalidad nueva
- [ ] fix — corrección de bug
- [ ] refactor — sin cambio de comportamiento
- [ ] docs — solo documentación
- [ ] chore — tooling, dependencias, infra
- [ ] otro: ____________________

## Checklist

- [ ] Título del PR sigue Conventional Commits (`feat(scope): ...`).
- [ ] Lint pasa en local.
- [ ] Type check pasa en local (si aplica).
- [ ] Tests pasan en local.
- [ ] Tests nuevos cubren los cambios funcionales.
- [ ] Los context packs (`memory/context-packs/<modulo>.md`) de los módulos afectados se actualizaron en este PR.
- [ ] Si este PR introduce una decisión arquitectónica, hay un ADR en `docs/adr/` también incluido.
- [ ] Si este PR resuelve una spec, la spec quedó marcada como `Status: Implementada` con el link al PR.
- [ ] No hay `console.log`, `TODO`, `FIXME`, `.only`, `.skip` ni imports muertos.
- [ ] Diff razonable de revisar (idealmente < 400 líneas; si no, hay justificación abajo).

## Reglas duras

- [ ] **No se está mergeando a `main` directamente.** Este PR apunta a `dev` (o a una `release/` si aplica).
- [ ] Si el PR fue generado por un agente, hay un humano que lo revisó antes de aprobar.

## Notas para review

- Áreas de riesgo a mirar con atención:
- Cosas que se decidieron en este PR y conviene cuestionar:
- Cosas que **no** entraron en este PR a propósito y van en otro:

## Capturas / evidencia

Si aplica (UI, dashboards, salidas de scripts).
