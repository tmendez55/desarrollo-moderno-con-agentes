# context-packs/

Un archivo por módulo del sistema. Cada uno contiene todo lo que el agente necesita saber para trabajar **dentro** de ese módulo sin tener que leer el repositorio entero.

## Cómo usar

1. Cuando creás un módulo en `src/modules/<modulo>/`, copiá la plantilla:
   ```bash
   cp memory/context-packs/CONTEXT_PACK_TEMPLATE.md memory/context-packs/<modulo>.md
   ```
2. Rellená propósito, entidades, casos de uso, APIs y errores conocidos.
3. Mantenelo al día: si cambia una entidad, actualizá el context pack en el mismo PR.

## Por qué importa

Un agente que trabaja en un módulo sin context pack tiene dos opciones malas: leer todo el código del módulo cada vez (lento, ruidoso) o inventar (rápido, mal). Un context pack actualizado le da el resumen denso que necesita para decidir bien con poca lectura.

## Convenciones

- Un archivo por módulo top-level. Submódulos se cubren dentro del mismo archivo, no en archivos aparte.
- Nombre del archivo = nombre del módulo, en kebab-case: `auth.md`, `billing.md`, `user-onboarding.md`.
- Si un módulo desaparece, su context pack también.
