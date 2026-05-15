# session/

**Esta carpeta queda vacía a propósito.**

Representa la **Capa 4** del modelo de contexto: la sesión actual. Existe como recordatorio explícito de una regla:

> **No persistas información de sesión acá.**

## Qué es información de sesión

- La conversación en curso entre el usuario y el agente.
- Los archivos que el agente abrió en esta sesión.
- Los resultados de los últimos tool calls.
- El plan de pasos que el agente está siguiendo ahora.
- Hipótesis temporales sobre lo que el usuario quiere.

Todo eso vive en la memoria activa del agente durante la sesión y se descarta al cerrar. **Eso es deseable**: si lo persistieras, contaminaría la próxima sesión con contexto desactualizado y harías que el agente arrastre suposiciones que ya dejaron de ser ciertas.

## Por qué existe la carpeta vacía

Porque la ausencia explícita comunica mejor que la ausencia silenciosa. Cuando alguien que recién llega ve `memory/context-packs/`, `memory/agent-memory/` y `memory/session/`, entiende de un vistazo que el modelo tiene cuatro capas y dónde encaja cada una. Si la carpeta no estuviera, faltaría la mitad del mapa.

## Si encontrás archivos acá

Hay tres posibilidades:

1. Alguien confundió las capas y guardó memoria persistente acá. Movelo a `agent-memory/` (o a `context-packs/` si es conocimiento del proyecto).
2. Alguien confundió esto con una carpeta de scratch. Hay que mudar el contenido a otra parte y vaciar la carpeta.
3. Es un experimento intencional. Documentar en un ADR para que no se confunda con un error.
