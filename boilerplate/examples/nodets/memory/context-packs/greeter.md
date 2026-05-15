# Context Pack — `greeter`

- **Módulo**: `src/modules/greeter/`
- **Owner**: ejemplo del boilerplate
- **Última actualización**: 2026-05-15

## 1. Propósito

`greeter` produce saludos personalizados a partir de un nombre y un idioma. Es un módulo de demostración: cubre el "happy path" mínimo del boilerplate (una función pura, un tipo de retorno bien definido, validación de entrada y tests asociados) sin involucrar IO ni dependencias externas.

Existe como módulo separado para mostrar el patrón de `index.ts` como API pública, aunque para una función tan chica podría vivir directamente en `src/`. La separación se mantiene para que el ejemplo refleje cómo se vería un módulo real.

## 2. Entidades de dominio

- **`Greeting`**: representa un saludo computado. Es inmutable (todos sus campos son `readonly`) y agrupa el destinatario normalizado, el idioma usado y el mensaje final.
- **`Language`**: tipo unión literal `'es' | 'en'`. No es un enum: en TypeScript los uniones literales son más simples y producen mejor inferencia.

Invariantes:

- Un `Greeting` con `recipient` vacío no debería existir: la función `greet` lanza antes de construirlo.
- `language` siempre coincide con la clave usada en `TEMPLATES`. Si se agrega un idioma, se actualiza el `Language` y el `TEMPLATES` en el mismo cambio.

## 3. Casos de uso

| Caso de uso | Entrada | Salida | Quién lo dispara |
|---|---|---|---|
| `saludar` | `name: string`, `lang?: 'es' \| 'en'` | `Greeting` | CLI (`src/index.ts`); otros módulos podrían consumirlo programáticamente. |

## 4. APIs / Endpoints

API pública del módulo (exportada desde `src/modules/greeter/index.ts`):

```ts
export function greet(name: string, lang?: 'es' | 'en'): Greeting;
export interface Greeting {
  readonly recipient: string;
  readonly language: 'es' | 'en';
  readonly message: string;
}
export type Language = 'es' | 'en';
```

No expone HTTP ni red. El consumo es programático.

## 5. Schemas

No aplica: el módulo no persiste datos.

## 6. Eventos emitidos / consumidos

No aplica: el módulo no participa en mensajería.

## 7. Tests existentes

- Unit tests: `src/modules/greeter/greeter.test.ts`. Cubren camino feliz en español, camino feliz en inglés, normalización con `trim`, error con entrada vacía y forma del objeto retornado.

Hueco de cobertura conocido: la función no se ejerce con strings que contengan caracteres especiales (emojis, RTL). Si el módulo crece más allá del demo, agregar tests con strings non-ASCII.

## 8. Errores conocidos

- Si se pasa un `lang` que no es `'es'` ni `'en'`, TypeScript lo previene en compile-time, pero en runtime (si el caller viene de fuera del sistema de tipos, como CLI args) el código indexa `TEMPLATES[lang]` y daría `undefined`. El entry point en `src/index.ts` debería validar antes de pasar `lang`; hoy no lo hace por simplicidad. Si esto se convierte en un módulo real, agregar validación explícita.

## 9. Decisiones específicas del módulo

- **No enum, union de literales**: porque los enums en TypeScript tienen comportamientos sutiles (numeric enums, reverse mappings) que rara vez valen la pena. Una union de strings literales basta.
- **Template como `Record<Language, fn>`** en lugar de `switch`: para que agregar un idioma sea un solo cambio en el objeto, y para que TypeScript fuerce a cubrir todos los miembros del union.
- **`Greeting` con todos los campos `readonly`**: evita mutaciones accidentales aguas abajo. Cuesta cero y agrega seguridad.

## 10. Integraciones con otros módulos

- **Depende de**: nada.
- **Es consumido por**: `src/index.ts` (entry point CLI). No tiene otros consumidores en este ejemplo.
- **Comunicación**: llamada síncrona, importación directa de la API pública.
- **Acoplamientos a vigilar**: ninguno por ahora; es un módulo hoja.
