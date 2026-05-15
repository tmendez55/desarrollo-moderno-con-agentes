# specs/

Especificaciones de features. Cada feature relevante (no cada cambio trivial) tiene una spec antes de empezar a codear.

## Cómo usar

1. Copiá [SPEC_TEMPLATE.md](./SPEC_TEMPLATE.md) a `NNNN-nombre-feature.md` donde `NNNN` es un número secuencial.
2. Rellenala con contexto de negocio, criterios de aceptación y escenarios.
3. Mostrasela al agente al inicio de la sesión y pedile que la trate como contrato.
4. Cuando la feature está hecha, marcala como `Status: Implementada` y agregá un enlace al PR.

## Por qué importa

Una spec bien escrita es la diferencia entre un agente que entrega lo que pediste y un agente que entrega lo que **interpretó** que pediste. Las decisiones que no quedan en la spec las toma el agente, y vos no te enterás hasta el code review.
