# charla-agentes-demo

Recurso público para la charla técnica **"Desarrollo Moderno con Agentes de IA"**.

## Qué hay aquí

Este repositorio está dividido en dos directorios con propósitos distintos:

### [examples/](./examples)

Tres versiones del mismo proyecto —un juego web de proyectiles tipo resortera— generadas por un agente con prompts de calidad creciente. Sirve para mostrar cómo cambia la salida del agente cuando cambia la calidad del prompt. Cada subcarpeta documenta el prompt usado y conserva el resultado tal cual lo produjo el agente.

### [boilerplate/](./boilerplate)

Plantilla agnóstica al lenguaje para empezar cualquier proyecto de software diseñado para colaborar con agentes de IA. Materializa el modelo de cuatro capas de contexto (instrucciones del proyecto, conocimiento por módulo, memoria del agente, sesión actual). Incluye un ejemplo concreto en Node/TypeScript para ver el sistema aplicado.

## Cómo usar este repo

### Quiero ver los ejemplos

Ve a [examples/angry-game/](./examples/angry-game). Cada subcarpeta tiene su prompt y su resultado. Abrí los `index.html` en el navegador para comparar.

### Quiero empezar un proyecto nuevo

Ve a [boilerplate/](./boilerplate) y leé el [QUICKSTART](./boilerplate/QUICKSTART.md). El proceso es: copiar la carpeta, correr `scripts/bootstrap.sh`, rellenar `AGENT_INSTRUCTIONS.md` con tu stack, y abrir tu agente preferido sobre el repo.

## Contexto de la charla

La charla aborda cómo construir proyectos que escalen cuando el agente forma parte del equipo. El punto central es que un agente no falla por falta de inteligencia sino por falta de contexto: olvida entre sesiones, no comparte memoria con otras instancias, y depende por completo de lo que esté escrito en el repo. Este repositorio acompaña la charla con dos recursos prácticos: ejemplos comparables de prompting y un boilerplate que materializa las prácticas recomendadas.
