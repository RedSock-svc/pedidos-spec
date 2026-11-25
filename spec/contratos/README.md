# Contratos

APIs (OpenAPI) y eventos (AsyncAPI) entre los componentes de `pedidos`, con otros productos o con sistemas externos. Los componentes solo se comunican a través de lo que está aquí.

- **Nombre:** `<nombre>.v<mayor>.<openapi|asyncapi>.yaml`. Por ejemplo, `pedidos-api.v1.openapi.yaml`.
- **Cambios compatibles** (operación nueva, campo opcional, valor nuevo): se editan en el mismo archivo.
- **Cambios incompatibles:** no se toca el archivo; se crea `v2`, que convive con `v1` hasta que nadie la use.
- **Errores:** cada error tiene un código en mayúsculas (`STOCK_INSUFICIENTE`). Si lo consume un componente con interfaz, tiene su texto `error.<CODIGO>` en `spec/textos/`.
- **Sistemas externos:** su contrato va en `externos/<sistema>/`.
