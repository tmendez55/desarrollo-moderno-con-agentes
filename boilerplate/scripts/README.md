# scripts/

Scripts auxiliares del proyecto. Por convención son bash POSIX y vivienen en este directorio para que sean fáciles de encontrar.

## Contenido

- [bootstrap.sh](./bootstrap.sh) — Inicializa un proyecto nuevo a partir del boilerplate. Pide el nombre del proyecto, reemplaza placeholders, decide cómo manejar la carpeta de memoria privada, opcionalmente renombra el archivo de instrucciones del agente, y crea un git nuevo.

## Convenciones

- Cada script empieza con `#!/usr/bin/env bash` y `set -euo pipefail`.
- Cada script es idempotente: correrlo dos veces no rompe nada ni duplica trabajo.
- Cada script imprime qué está por hacer **antes** de hacerlo, y confirma antes de pasos destructivos.
- Si un script crece más de 100 líneas, se lo separa en funciones o se lo migra a un lenguaje más cómodo (Python, Go) documentando la decisión.
