# Reglas de negocio

Restricciones y cálculos que siempre deben cumplirse, sea cual sea el caso de uso. Un archivo por módulo del dominio (`<modulo>.md`, el mismo nombre que en `spec/dominio/`).

Cada regla tiene un identificador `RN-` **único en todo el producto**, no solo en su módulo, y que no se reutiliza aunque la regla se retire.

## Formato de cada regla

```markdown
## RN-001: <Nombre corto>

<La regla, en una o dos frases, sin ambigüedad. Si es un cálculo, la fórmula y un ejemplo con números.>

- **Error si no se cumple:** CODIGO_DE_ERROR (si aplica)
```

Qué casos de uso aplican cada regla lo dice la cabecera de cada caso de uso (`reglas:`), no la regla.
