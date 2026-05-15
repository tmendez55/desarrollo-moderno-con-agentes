# Context Pack — `<<NOMBRE_MODULO>>`

- **Módulo**: `src/modules/<<modulo>>/`
- **Owner**: `<<NOMBRE_O_ROL>>`
- **Última actualización**: `YYYY-MM-DD`

## 1. Propósito

`<<UNO_O_DOS_PARRAFOS_DESCRIBIENDO_QUE_HACE_ESTE_MODULO_Y_POR_QUE_EXISTE>>`

¿Qué problema concreto resuelve dentro del sistema? ¿Por qué es un módulo separado y no parte de otro?

## 2. Entidades de dominio

Lista de tipos / agregados / entidades principales del módulo. Para cada uno, una línea con su rol.

- **`<<EntidadA>>`**: `<<UNA_LINEA_DESCRIBIENDO_QUE_REPRESENTA>>`.
- **`<<EntidadB>>`**: `<<...>>`.
- **`<<ValueObjectC>>`**: `<<...>>`.

Si hay invariantes (reglas que siempre deben cumplirse), listalas aquí:

- Invariante 1: `<<EJ_UN_USUARIO_NO_PUEDE_TENER_DOS_EMAILS_VERIFICADOS>>`.

## 3. Casos de uso

Casos de uso que el módulo expone hacia afuera.

| Caso de uso | Entrada | Salida | Quién lo dispara |
|---|---|---|---|
| `<<crear_X>>` | `<<...>>` | `<<...>>` | `<<HTTP / cron / otro módulo>>` |
| `<<actualizar_Y>>` | `<<...>>` | `<<...>>` | `<<...>>` |

## 4. APIs / Endpoints

Si el módulo expone APIs:

- `<<METHOD>> <<ruta>>` — `<<descripción>>` — auth: `<<sí/no/rol>>`.
- `<<METHOD>> <<ruta>>` — `<<descripción>>`.

Si expone solo una interfaz programática:

```<<lenguaje>>
<<firma_de_la_funcion_o_clase_publica>>
```

## 5. Schemas

Schemas de tablas / colecciones / mensajes relevantes para este módulo.

```
<<schema_compacto>>
```

Mencionar índices clave y constraints duros.

## 6. Eventos emitidos / consumidos

Si el módulo participa en mensajería:

- **Emite**: `<<nombre_evento_1>>`, `<<nombre_evento_2>>`.
- **Consume**: `<<nombre_evento_3>>`.

Para cada uno, qué dispara su emisión / consumo y qué payload tiene.

## 7. Tests existentes

- Unit tests: `tests/unit/<<modulo>>/` — cubren `<<que_cubren>>`.
- Integration tests: `tests/integration/<<modulo>>/` — cubren `<<que_cubren>>`.
- E2E: `<<si_aplica>>`.

Hueco de cobertura conocido: `<<descripcion>>`.

## 8. Errores conocidos

`<<LISTA_DE_PROBLEMAS_NO_OBVIOS_QUE_EL_AGENTE_DEBE_CONOCER>>`

- `<<ERROR_1>>` — cómo se manifiesta, cuál es la causa, qué workaround usar.
- `<<ERROR_2>>` — `<<...>>`.

## 9. Decisiones específicas del módulo

Decisiones que afectan solo a este módulo (las globales viven en ADRs):

- `<<EJ_USAMOS_REPO_PATTERN_AUNQUE_EL_RESTO_DEL_SISTEMA_NO>>`.
- `<<EJ_LA_CACHE_LOCAL_TIENE_TTL_DE_5_MINUTOS>>`.

## 10. Integraciones con otros módulos

- **Depende de**: `<<modulo_X>>` para `<<para_que>>`.
- **Es consumido por**: `<<modulo_Y>>`, `<<modulo_Z>>`.
- **Comunicación**: `<<llamadas_sync / eventos_async / ambas>>`.
- **Acoplamientos a vigilar**: `<<descripcion>>`.
