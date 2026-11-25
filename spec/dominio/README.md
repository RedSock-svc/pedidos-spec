# Modelo de dominio

Un archivo por módulo del dominio (`<modulo>.md`), con sus entidades, sus eventos de dominio y la clase de cada dato, más el glosario común (`glosario.md`). Describe el dominio, no cómo se guarda: las tablas son de cada componente. Un producto pequeño puede tener un solo módulo.

Clases de dato:

| Clase | Qué implica |
|---|---|
| `público` | Nada especial |
| `interno` | No sale del producto salvo a través de un contrato |
| `personal` | No va a logs ni trazas, no se copia a entornos de prueba, tiene retención y se puede borrar a petición |
| `sensible` | Lo de personal, más cifrado en reposo y registro de cada acceso |

Clasificar un dato como personal o sensible lo aprueba Seguridad.

## Formato de un módulo

```markdown
# Módulo: <nombre>

<Qué responsabilidad tiene, en una frase.>

## Entidad: <Nombre>

| Atributo | Tipo | Clase | Descripción |
|---|---|---|---|
| id | identificador | interno | |

## Eventos de dominio

| Evento | Cuándo se produce | Datos que lleva |
|---|---|---|
| PedidoConfirmado | Al confirmar un pedido | idPedido, idCliente (identificadores, no datos personales) |
```
