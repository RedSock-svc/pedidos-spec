# Reglas de negocio: pedidos

<!-- Formato en README.md. Los identificadores RN- son únicos en todo el producto. -->

## RN-001: Stock suficiente

Un pedido solo se confirma si la cantidad pedida es menor o igual que el stock del producto en ese momento. Al confirmarlo, el stock baja en la cantidad pedida. El stock nunca es negativo, tampoco cuando llegan a la vez varios pedidos del mismo producto: si no hay stock para todos, los que no caben se rechazan.

- **Error si no se cumple:** `STOCK_INSUFICIENTE`

## RN-002: Cantidad válida

La cantidad de un pedido es un número entero mayor o igual que 1.

- **Error si no se cumple:** `CANTIDAD_NO_VALIDA` si es menor que 1. Si ni siquiera es un número entero, el contrato rechaza la petición antes con `PETICION_NO_VALIDA`

## RN-003: Titular del pedido

Un pedido pertenece siempre al cliente identificado que lo crea. El titular sale de la identidad del cliente, nunca de un dato de la petición.

- **Error si no se cumple:** `NO_IDENTIFICADO`, si no hay un cliente identificado

## RN-004: Importe total

El importe total de un pedido es el precio del producto en el momento de confirmarlo multiplicado por la cantidad. Los importes se expresan en céntimos de euro, como números enteros, para no tener errores de redondeo.

Ejemplo: 3 unidades de un producto de 12,50 € (`1250`) → importe total de 37,50 € (`3750`).
