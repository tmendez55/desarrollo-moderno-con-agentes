# src/

Código del proyecto. La convención es **organizar por módulo, con boundary claro entre capas**.

## Layout esperado

```
src/
└── modules/
    ├── <modulo-a>/
    │   ├── domain/           Entidades, value objects, reglas de negocio puras.
    │   ├── application/      Casos de uso. Orquestan el dominio.
    │   └── infrastructure/   Adaptadores: DB, HTTP, mensajería, terceros.
    └── <modulo-b>/
        ├── domain/
        ├── application/
        └── infrastructure/
```

Esta no es la única forma válida de organizar código, pero es la elegida por este boilerplate. Si el proyecto decide otra (por ejemplo, organizar por capa global en vez de por módulo), documentalo como ADR y actualizá este archivo y `AGENT_INSTRUCTIONS.md`.

## Reglas de dependencia

- **`domain/` no importa de `application/` ni de `infrastructure/`.** El dominio es puro: entidades, reglas, invariantes. Si algo en `domain/` necesita IO, está mal ubicado.
- **`application/` puede importar de `domain/`** del mismo módulo, pero **no de `infrastructure/`**. Habla con la infraestructura a través de interfaces que la propia `application/` define y la `infrastructure/` implementa.
- **`infrastructure/` puede importar de `application/` y de `domain/`** del mismo módulo. Implementa los puertos que `application/` declara.
- **Comunicación entre módulos**: a través de las APIs públicas del módulo (lo que se exporta desde su `index`). Nunca importar `src/modules/A/infrastructure/...` desde el módulo `B`.

## Por qué importa la separación de responsabilidades

Un agente que respeta la arquitectura puede trabajar en un módulo sin romper otro. Un agente que no la respeta —porque la arquitectura no estaba escrita, o porque ningún archivo de contexto se la explicó— colapsa el sistema en un solo plato de espaguetis en cuestión de semanas.

La regla operativa: **cada vez que el agente vaya a tocar `src/`, primero lee el context pack del módulo afectado y verifica en qué capa cae el cambio**. Si un cambio no encaja limpio en una capa, eso ya es una señal de problema arquitectónico que merece conversación antes de avanzar.

## El `modules/.gitkeep`

Existe solo para que git versione la carpeta vacía. Cuando agregás el primer módulo real, podés borrarlo.
