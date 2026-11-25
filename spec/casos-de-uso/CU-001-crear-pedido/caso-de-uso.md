---
# Datos del caso de uso que leen los controles, el registro y los agentes. Es la única copia de estos datos:
# el texto de abajo no los repite.
id: CU-001
nombre: Crear pedido
modulo: pedidos
actor: Cliente
componentes: [backend, web]
flag:
  nombre: CU-001-crear-pedido
  retirada: 2027-06-30
reglas: [RN-001, RN-002, RN-003, RN-004]
requisitos: [RNF-001, RNF-003]
contratos: [pedidos-api.v1]
---

# CU-001: Crear pedido

**Objetivo:** el cliente pide unidades de un producto y se queda con el pedido confirmado y el stock reservado.

## Precondiciones

- El cliente está identificado en el proveedor de identidad del producto.
- Hay productos en el catálogo. Cómo se dan de alta queda fuera de este caso de uso: en los entornos de prueba se cargan con los datos sintéticos de `e2e/datos/`.

## Flujo principal

1. El cliente abre la pantalla de nuevo pedido.
2. El sistema muestra los productos del catálogo con su nombre, su precio y las unidades en stock. Los que no tienen stock se muestran como agotados y no se pueden elegir.
3. El cliente elige un producto y una cantidad.
4. El cliente confirma el pedido.
5. El sistema comprueba que la cantidad es válida (`RN-002`) y que hay stock suficiente (`RN-001`).
6. El sistema crea el pedido a nombre del cliente identificado (`RN-003`), en estado `CONFIRMADO`, con su importe total (`RN-004`), y resta la cantidad del stock del producto.
7. El sistema muestra el pedido confirmado: número de pedido, producto, cantidad e importe total.

**Resultado:** existe un pedido `CONFIRMADO` del cliente y el stock del producto ha bajado en la cantidad pedida.

Un pedido es de **un solo producto**. Los pedidos con varios productos serán otro caso de uso.

## Flujos alternativos

### A1. Stock insuficiente (en el paso 5)

- **Cuándo:** la cantidad pedida es mayor que el stock del producto, también cuando otro pedido ha consumido el stock entre los pasos 2 y 4.
- **Qué pasa:** el pedido se rechaza con el error `STOCK_INSUFICIENTE`. El cliente ve el aviso y puede cambiar la cantidad.
- **Resultado:** no se crea ningún pedido y el stock no cambia.

### A2. Cantidad no válida (en el paso 5)

- **Cuándo:** la cantidad es menor que 1.
- **Qué pasa:** el pedido se rechaza con el error `CANTIDAD_NO_VALIDA`. La web no deja confirmar con una cantidad menor que 1, pero el backend lo comprueba igualmente.
- **Resultado:** no se crea ningún pedido y el stock no cambia.

### A3. Producto no encontrado (en el paso 5)

- **Cuándo:** el producto pedido no existe en el catálogo.
- **Qué pasa:** el pedido se rechaza con el error `PRODUCTO_NO_ENCONTRADO`.
- **Resultado:** no se crea ningún pedido.

### A4. Cliente no identificado (en cualquier paso)

- **Cuándo:** la petición llega sin identidad, o con una que no es válida o ha caducado.
- **Qué pasa:** el sistema la rechaza con el error `NO_IDENTIFICADO` y la web lleva al cliente a identificarse.
- **Resultado:** no se crea ningún pedido.

### A5. Petición mal formada (en el paso 5)

- **Cuándo:** la petición no cumple el contrato: por ejemplo, la cantidad no es un número entero o falta el producto.
- **Qué pasa:** el sistema la rechaza con el error `PETICION_NO_VALIDA`. La web nunca envía una petición así; este flujo protege al backend de otros clientes.
- **Resultado:** no se crea ningún pedido y el stock no cambia.

## Cambios en los contratos

| Contrato | Operación o evento | Cambio |
|---|---|---|
| `pedidos-api.v1` | `GET /productos` | Nueva |
| `pedidos-api.v1` | `POST /pedidos` | Nueva |

## Preguntas abiertas

- Ninguna.

Resueltas en esta versión:

1. **Clase de `idCliente`:** `personal` (dato seudonimizado), con su anonimización en `RNF-003`. Lo aprueba Seguridad.
2. **Pedidos masivos:** se aceptan sin mitigar mientras `pedidos` sea un producto de prueba (`docs/adr/ADR-001-aceptar-pedidos-masivos-en-el-piloto.md`). Lo aprueba Seguridad.

## Cuándo está lista

- [x] No quedan preguntas abiertas.
- [x] La cabecera está completa: actor, componentes, flag, reglas, requisitos y contratos.
- [x] Objetivo, flujo principal y flujos alternativos escritos.
- [x] `aceptacion.feature` tiene al menos un escenario para el flujo principal y uno por cada error, cada uno con su etiqueta.
- [x] Las reglas de negocio que aplica están escritas y tienen identificador.
- [x] Los contratos que cambian están actualizados.
- [x] Los términos nuevos están en el glosario y los datos nuevos tienen su clase.
- [x] Los requisitos no funcionales que le aplican están escritos y son medibles.
- [x] Si interviene un componente con interfaz, `interfaz.md` tiene sus pantallas y su flujo, y los textos están en `spec/textos/`.
- [ ] Aprobada y publicada en una versión de este repo.
