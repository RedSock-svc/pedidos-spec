# CU-001: Crear pedido · Interfaz

Las pantallas se construyen con los componentes de `red-ui`. Todavía no hay diseño gráfico: la estructura y los estados de cada pantalla bastan para el piloto. Cuando haya diseño, sus imágenes se exportan a `imagenes/`, en esta misma carpeta. Los textos se citan por su clave de `spec/textos/`.

## Flujo

1. `nuevo-pedido` → `pedido-confirmado` (flujo principal)
2. Si el backend rechaza el pedido (A1, A2, A3): se queda en `nuevo-pedido` con el aviso de error
3. Si la sesión ha caducado (A4): aviso y paso al inicio de sesión del proveedor de identidad
4. Desde `pedido-confirmado`, "Hacer otro pedido" vuelve a `nuevo-pedido`

## Pantalla: nuevo-pedido

Título `pedido.nuevo.titulo`. Lista de productos; cada uno muestra su nombre, su precio (`pedido.nuevo.precio`) y su stock (`pedido.nuevo.stock`). El cliente elige uno, indica la cantidad (`pedido.nuevo.cantidad`, por defecto 1) y pulsa `pedido.confirmar.boton`.

| Estado | Qué ve el usuario |
|---|---|
| Cargando | `pedido.cargando` |
| Vacío | `pedido.vacio` |
| Error | El texto `error.<CODIGO>` que devuelve el backend encima del formulario, sin perder el producto ni la cantidad elegidos. Si el error no tiene texto, `error.generico` |
| Éxito | Pasa a `pedido-confirmado` |

- El botón `pedido.confirmar.boton` está desactivado mientras no hay un producto elegido o la cantidad es menor que 1.
- Los precios se muestran en euros con dos decimales y coma decimal: `1250` → `12,50`.

Textos que usa: `pedido.nuevo.titulo`, `pedido.nuevo.precio`, `pedido.nuevo.stock`, `pedido.nuevo.cantidad`, `pedido.confirmar.boton`, `pedido.cargando`, `pedido.vacio`, `error.*`

## Pantalla: pedido-confirmado

Título `pedido.confirmado.titulo`, con el número de pedido (`pedido.confirmado.numero`), el producto, la cantidad y el importe total (`pedido.confirmado.importe`). Un enlace `pedido.confirmado.otro` vuelve a `nuevo-pedido`.

| Estado | Qué ve el usuario |
|---|---|
| Éxito | El pedido confirmado |

Textos que usa: `pedido.confirmado.titulo`, `pedido.confirmado.numero`, `pedido.confirmado.importe`, `pedido.confirmado.otro`
