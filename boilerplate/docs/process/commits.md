# Commits

Este proyecto usa **Conventional Commits**. El formato es chico y la disciplina paga: la historia del repo se vuelve legible para humanos y procesable por herramientas (changelogs, releases automáticos, búsquedas).

## Formato

```
<type>(<scope opcional>): <descripción imperativa en minúsculas>

<cuerpo opcional explicando el por qué>

<footer opcional con refs a issues / breaking changes>
```

## Tipos aceptados

| Tipo | Cuándo usarlo |
|---|---|
| `feat` | Funcionalidad nueva visible para el usuario. |
| `fix` | Corrección de bug. |
| `docs` | Solo documentación. |
| `style` | Formato, espacios, sin cambios funcionales. |
| `refactor` | Reestructura interna sin cambiar comportamiento. |
| `perf` | Mejora de performance. |
| `test` | Agrega o corrige tests. |
| `chore` | Tooling, dependencias, configuración. |
| `build` | Cambios al sistema de build. |
| `ci` | Cambios al pipeline de CI. |
| `revert` | Revertir un commit previo. |

## Ejemplos

```
feat(auth): agregar login con OTP por SMS

Permite al usuario recibir un código de 6 dígitos por SMS como
segundo factor. La generación corre del lado del servidor y el
código expira en 5 minutos.

Closes #142
```

```
fix(reports): corregir suma de horas cuando cruzan la medianoche

El agregador asumía que todos los intervalos terminaban el mismo
día que empezaban. Ahora normaliza a UTC antes de sumar.
```

```
chore(deps): actualizar dependencias menores
```

```
docs(adr): agregar ADR-0007 sobre uso de event sourcing

Decisión tomada en la reunión del 2026-05-10.
```

## Reglas duras

- Una idea por commit. No mezclar refactor con feature nueva en el mismo commit.
- El mensaje en imperativo: "agregar X", no "agregado X" ni "agregando X".
- Si la descripción no entra en 72 caracteres, pasá el detalle al cuerpo del commit.
- Breaking changes: agregá `!` después del tipo o un footer `BREAKING CHANGE:`.
- El agente nunca firma sus commits con co-autoría salvo que el usuario lo pida explícitamente.
