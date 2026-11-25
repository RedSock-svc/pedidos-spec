# Módulo: pedidos

Los pedidos de los clientes. Formato y clases de dato en `README.md`.

## Entidad: Pedido

| Atributo | Tipo | Clase | Descripción |
|---|---|---|---|
| id | identificador | interno | Número de pedido que ve el cliente |
| idCliente | identificador del proveedor de identidad | personal | Titular del pedido (`RN-003`). Dato personal seudonimizado: no contiene el nombre ni el email del cliente, pero permite saber qué pedidos hizo una persona. No va a logs ni trazas (`RNF-BASE-002`) y se anonimiza según `RNF-003` |
| idProducto | identificador | interno | Producto pedido, del módulo `catalogo`. Un pedido es de un solo producto |
| cantidad | entero ≥ 1 | interno | (`RN-002`) |
| precioUnitario | entero ≥ 0, céntimos de euro | interno | Precio del producto al confirmar el pedido |
| importeTotal | entero ≥ 0, céntimos de euro | interno | (`RN-004`) |
| estado | enumerado: `CONFIRMADO` | interno | Por ahora solo hay un estado. Los siguientes llegarán con otros casos de uso |
| fechaCreacion | fecha y hora, UTC | interno | |

## Eventos de dominio

Ninguno por ahora. El piloto no tiene eventos ni broker; `PedidoConfirmado` se añadirá en una versión posterior de CU-001.
