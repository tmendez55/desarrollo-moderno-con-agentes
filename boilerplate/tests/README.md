# tests/

Estructura recomendada de pruebas. Tres categorías principales y una cuarta complementaria.

## Estructura

```
tests/
├── unit/
│   └── <modulo>/         Tests unitarios espejo del layout de src/modules/.
├── integration/
│   └── <modulo>/         Tests que cruzan boundaries de un mismo módulo o entre módulos.
└── e2e/                  Pruebas end-to-end del sistema entero (API → DB → respuesta).
```

## Qué va en cada categoría

### Unit

Aísla una unidad pequeña (función, clase, entidad) y la prueba en milisegundos. Sin red, sin disco, sin DB. Fakes y stubs son ok; mocks pesados que pretenden ser sistemas externos, no.

### Integration

Cruza al menos un boundary real: DB real (corriendo en docker), cliente HTTP real contra un servidor de test, sistema de archivos real, cola de mensajes real. La diferencia con los unit es que la integración valida que **los adaptadores realmente funcionan**, no solo que el código que los rodea sí.

### E2E

Trata el sistema como caja negra. Hace un request por la puerta de entrada (API HTTP, CLI, UI) y verifica el efecto observable por la puerta de salida (response, archivo en disco, evento publicado, fila en DB). Costoso de mantener y de correr; reservalos para los flujos críticos del producto, no para cubrir cada feature.

## Evals (testing complementario)

Cuando una parte del sistema involucra un agente o un modelo (clasificadores, extractores, generadores de texto), los tests tradicionales son insuficientes: no podés hacer `assertEqual` sobre una salida de lenguaje natural. Para esos casos se usan **evals**: conjuntos de inputs con criterios de evaluación que pueden ser determinísticos (regex, schemas) o juzgados por otro modelo (LLM-as-judge).

Los evals son complementarios al testing tradicional, no reemplazo. Conviven en el repo como otra carpeta paralela (`evals/`) o como parte de `tests/`, según el tamaño del esfuerzo.

## Reglas duras

- Un cambio funcional viene con su test.
- Tests rotos no se mergean.
- Tests flaky no se "calman" con retry; se diagnostican.
- No commitear `console.log` ni `.only` ni `.skip` en tests.
