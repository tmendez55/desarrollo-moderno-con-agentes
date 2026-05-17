# Desarrollo moderno con agentes de IA

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

## Recursos adicionales y primeros pasos

Si esta charla te dejó con ganas de profundizar, acá hay material gratuito y en español para empezar. Está ordenado de menor a mayor profundidad técnica.

### Primeros pasos: programar con IA

- [Curso de Desarrollo con IA 2026 — MoureDev (playlist)](https://www.youtube.com/watch?v=uRzoVP63RiI&list=PLNdFk2_brsRezQet-laPIrSXGr7hnAxiC) — Brais Moure muestra desde cero cómo usar la IA como programador profesional. Buen punto de entrada si nunca trabajaste con un agente.
- [Canal de midudev](https://www.youtube.com/@midudev) — uno de los referentes en español de desarrollo web moderno, con contenido frecuente sobre IA aplicada al día a día del programador.

### OpenCode

[OpenCode](https://opencode.ai) es un agente de IA open-source que corre en la terminal (similar a Claude Code, pero con más de 75 proveedores de modelos y licencia MIT). Es una de las herramientas que menciono en la charla.

- [Curso de OpenCode desde cero — midudev](https://midu.dev/curso/opencode-desde-cero) — curso gratuito en español: instalación, primeros prompts, modelos, agent skills, comandos propios y automatización de sesiones.
- [Cómo usar OpenCode — WebReactiva](https://www.webreactiva.com/blog/como-usar-opencode) — tutorial en español enfocado en proveedores gratuitos (Copilot, ChatGPT, Ollama), Plan vs Build y flujos de trabajo productivos.
- [Documentación oficial de OpenCode](https://opencode.ai/docs/) — referencia (en inglés) para configuración avanzada, agentes personalizados e integración con GitHub.

### MCP (Model Context Protocol)

El estándar abierto que permite que un agente se conecte a herramientas, datos y servicios externos. Si vas a construir agentes en serio, esto es la base.

- [Curso Intensivo de MCP — midudev](https://midu.dev/curso/intensivo-mcp/) — curso gratuito en español, paso a paso, para crear e integrar MCPs con LLMs, APIs y bases de datos.
- [¿Qué es el MCP? — midudev](https://midu.dev/curso/intensivo-mcp/00-introduccion/01-que-es-el-mcp/) — la introducción conceptual del curso anterior, útil incluso si no vas a hacer el curso completo.

### Cursos oficiales de Anthropic (doblados al español)

- [Cursos gratis de Claude — resumen en Xataka](https://www.xataka.com/basics/cursos-gratis-claude-creados-anthropic-15-cursos-oficiales-certificacion-para-aprender-exprimir-su-ia) — guía en español a los más de 15 cursos oficiales de Anthropic, todos gratuitos y con certificación. Incluye rutas sobre Claude Code, MCP, agentes y subagentes.
- [Anthropic Academy (plataforma)](https://www.anthropic.com/learn/build-with-claude) — acceso directo a los cursos (interfaz en inglés, varios cursos con audio/subtítulos en español).

### Evals: cómo medir si tu agente funciona

Un agente sin evaluación es un experimento, no un producto. Estos recursos explican cómo medir calidad de forma sistemática.

- [Cómo evaluar agentes de IA — Chanl](https://www.chanl.ai/es/blog/how-to-evaluate-ai-agents-build-eval-framework) — guía práctica en español para construir un framework de evals desde cero.
- [Evalúa y mejora tus agentes con RAGAS — AWS en Español (dev.to)](https://dev.to/aws-espanol/evalua-y-mejora-tus-agentes-evaluacion-automatizada-con-ragas-para-agentes-de-produccion-el8) — tutorial en español sobre evaluación automatizada de agentes en producción.
- [¿Qué es la evaluación de agentes de IA? — IBM](https://www.ibm.com/think/topics/ai-agent-evaluation) — referencia conceptual en español, útil como marco de vocabulario.
