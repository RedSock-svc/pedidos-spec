# language: es

Característica: CU-001 Crear pedido

  Un cliente identificado pide unidades de un producto del catálogo.
  El pedido se confirma solo si hay stock suficiente, y entonces el stock baja.

  # --- Backend ---------------------------------------------------------------

  @backend
  Escenario: el cliente consulta los productos del catálogo
    Dado un producto "Taza roja" con precio 1250 y 5 unidades en stock
    Cuando el cliente consulta los productos
    Entonces recibe el producto "Taza roja" con precio 1250 y 5 unidades en stock

  @backend
  Escenario: pedido con stock suficiente
    Dado un producto con precio 1250 y 5 unidades en stock
    Cuando el cliente pide 3 unidades
    Entonces el pedido queda en estado CONFIRMADO
    Y el importe total del pedido es 3750
    Y el stock del producto baja a 2

  @backend
  Escenario: pedido de todo el stock
    Dado un producto con 3 unidades en stock
    Cuando el cliente pide 3 unidades
    Entonces el pedido queda en estado CONFIRMADO
    Y el stock del producto baja a 0

  @backend
  Escenario: pedido sin stock suficiente
    Dado un producto con 2 unidades en stock
    Cuando el cliente pide 3 unidades
    Entonces el pedido se rechaza con el error STOCK_INSUFICIENTE
    Y el stock del producto no cambia
    Y no se crea ningún pedido

  @backend
  Escenario: dos pedidos a la vez por las últimas unidades
    Dado un producto con 3 unidades en stock
    Cuando dos clientes piden 2 unidades cada uno a la vez
    Entonces uno de los pedidos queda en estado CONFIRMADO
    Y el otro se rechaza con el error STOCK_INSUFICIENTE
    Y el stock del producto baja a 1

  @backend
  Esquema del escenario: pedido con una cantidad no válida
    Dado un producto con 5 unidades en stock
    Cuando el cliente pide <cantidad> unidades
    Entonces el pedido se rechaza con el error CANTIDAD_NO_VALIDA
    Y el stock del producto no cambia

    Ejemplos:
      | cantidad |
      | 0        |
      | -1       |

  @backend
  Esquema del escenario: pedido con una cantidad que no es un número entero
    Dado un producto con 5 unidades en stock
    Cuando el cliente envía un pedido con la cantidad <cantidad>
    Entonces la petición se rechaza con el error PETICION_NO_VALIDA
    Y el stock del producto no cambia

    Ejemplos:
      | cantidad |
      | "tres"   |
      | 1.5      |

  @backend
  Escenario: pedido de un producto que no existe
    Dado que no existe ningún producto con el identificador "no-existe"
    Cuando el cliente pide 1 unidad del producto "no-existe"
    Entonces el pedido se rechaza con el error PRODUCTO_NO_ENCONTRADO

  @backend
  Escenario: el pedido queda a nombre del cliente identificado
    Dado un producto con 5 unidades en stock
    Y el cliente identificado "cliente-a"
    Cuando el cliente pide 1 unidad indicando en la petición que el titular es "cliente-b"
    Entonces el pedido queda a nombre de "cliente-a"

  @backend
  Escenario: pedido sin identificarse
    Dado un producto con 5 unidades en stock
    Cuando alguien sin identificar pide 1 unidad
    Entonces la petición se rechaza con el error NO_IDENTIFICADO
    Y el stock del producto no cambia

  # --- Web -------------------------------------------------------------------

  @web
  Escenario: el cliente ve los productos que puede pedir
    Dado que el backend devuelve el producto "Taza roja" con precio 1250 y 5 unidades en stock
    Cuando el cliente abre la pantalla de nuevo pedido
    Entonces ve el producto "Taza roja" con el precio "12,50 €" y "5 unidades disponibles"

  @web
  Escenario: el cliente confirma un pedido
    Dado que el backend confirma el pedido número "P-1001" con un importe total de 3750
    Cuando el cliente elige el producto "Taza roja", indica 3 unidades y pulsa "Confirmar pedido"
    Entonces ve el mensaje "Pedido confirmado"
    Y ve el número de pedido "P-1001" y el importe total "37,50 €"

  @web
  Escenario: no se puede confirmar sin una cantidad válida
    Dado que el cliente ha elegido el producto "Taza roja"
    Cuando indica 0 unidades
    Entonces el botón "Confirmar pedido" está desactivado

  @web
  Escenario: aviso de stock insuficiente
    Dado que el backend rechaza el pedido con STOCK_INSUFICIENTE
    Cuando el cliente confirma el pedido
    Entonces ve el mensaje "No hay unidades suficientes"
    Y puede cambiar la cantidad y volver a confirmar

  @web
  Escenario: aviso de cantidad no válida
    Dado que el backend rechaza el pedido con CANTIDAD_NO_VALIDA
    Cuando el cliente confirma el pedido
    Entonces ve el mensaje "La cantidad debe ser un número entero mayor que cero"

  @web
  Escenario: aviso de producto no encontrado
    Dado que el backend rechaza el pedido con PRODUCTO_NO_ENCONTRADO
    Cuando el cliente confirma el pedido
    Entonces ve el mensaje "Este producto ya no está disponible"

  @web
  Escenario: sesión caducada
    Dado que el backend rechaza la petición con NO_IDENTIFICADO
    Cuando el cliente confirma el pedido
    Entonces ve el mensaje "Tu sesión ha caducado. Vuelve a identificarte"
    Y la web lo lleva a identificarse

  # --- Producto completo -----------------------------------------------------

  @e2e
  Escenario: el cliente completa un pedido
    Dado un cliente identificado
    Y el producto "Taza roja" con precio 1250 y 5 unidades en stock
    Cuando abre la pantalla de nuevo pedido, elige "Taza roja", indica 3 unidades y confirma
    Entonces ve el pedido como confirmado con un importe total de "37,50 €"
    Y al volver a la pantalla de nuevo pedido ve "2 unidades disponibles"
