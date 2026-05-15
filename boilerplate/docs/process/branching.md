# Branching

Este proyecto usa un flujo simple basado en `main` + `dev` + ramas con prefijo. No es git-flow estricto ni GitHub Flow puro; toma lo útil de cada uno y descarta la ceremonia.

## Ramas permanentes

- **`main`** — Refleja lo que está en producción. Estable, deployable en cualquier momento. Protegida: nadie hace push directo, ni siquiera el agente. Solo se actualiza vía PR aprobado por un humano.
- **`dev`** — Integración de features listas pero no liberadas todavía. Recibe merges de `feature/` y `hotfix/`. Periódicamente se promueve a `main` a través de una `release/`.

## Ramas temporales

| Prefijo | Para qué | Vida útil | Mergea a |
|---|---|---|---|
| `feature/` | Funcionalidad nueva. | Lo que dure la feature. | `dev` |
| `fix/` | Bugfix no urgente. | Corto. | `dev` |
| `hotfix/` | Bugfix urgente que va directo a producción. | Lo más corto posible. | `main` y `dev` |
| `release/` | Estabilización antes de promover a producción. | Días, no semanas. | `main` (y se cierra mergeando a `dev`) |
| `chore/` | Trabajo no funcional (refactor, deps, docs). | Corto. | `dev` |

## Nombres

`prefijo/descripcion-breve-en-kebab`. Ejemplos:

- `feature/login-con-otp`
- `fix/timezone-en-listados`
- `chore/actualizar-eslint`

## Justificación

¿Por qué no GitHub Flow puro (solo `main` + features)? Porque cuando el agente puede generar muchas features en paralelo, tener un `dev` evita que `main` se vuelva inestable mientras se acumulan cosas que todavía no quieres liberar.

¿Por qué no git-flow completo (con `develop`, `release`, `support`)? Porque la ceremonia adicional rara vez se sostiene en proyectos chicos, y la complejidad terminó siendo desventaja en la mayoría de equipos.

Si tu proyecto tiene una sola liberación por commit a `main` (deploy continuo), podés colapsar `dev` y trabajar directo contra `main` desde `feature/`. Documentalo como ADR.

## Reglas duras

- Nadie —ni el agente— hace push a `main` directamente.
- El agente trabaja siempre desde una rama temporal, nunca sobre `main` ni `dev`.
- Las ramas se borran una vez mergeadas.
