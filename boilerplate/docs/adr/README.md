# adr/

Architecture Decision Records. Una decisión arquitectónica relevante por archivo.

## Convenciones

- Numerados secuencialmente: `0001-titulo-kebab.md`, `0002-...`, etc.
- Inmutables una vez aceptados. Si la decisión cambia, se escribe un ADR nuevo con `Status: Accepted` que **supersede** al anterior, y el anterior pasa a `Status: Superseded by NNNN`.
- Cortos. Un ADR es 1–2 pantallas, no un ensayo.

## Cómo crear uno

```bash
cp docs/adr/ADR_TEMPLATE.md docs/adr/NNNN-tu-titulo.md
```

Rellenar las cuatro secciones canónicas: **Status, Context, Decision, Consequences**.

## Por qué importa

Sin ADRs, las decisiones quedan en el chat de Slack, en la cabeza de quien estaba ese día o en un commit con mensaje "refactor". El agente no tiene acceso a ninguno de esos lugares. Si querés que el agente respete las decisiones de arquitectura, esas decisiones tienen que vivir en `docs/adr/`.

## Índice

- [0001-record-architecture-decisions.md](./0001-record-architecture-decisions.md) — Usar ADRs en este proyecto.
