# language: es
#
# Escenarios del caso de uso de esta carpeta.
# Cada escenario lleva UNA etiqueta con dónde se prueba:
#   @backend, @web u otro componente de producto.yaml, o @e2e si necesita el producto completo.
# Al menos un escenario para el flujo principal y uno por cada error esperado.
# Los textos que ve el usuario se citan tal como están en spec/textos/.

Característica: CU-00N <Nombre del caso de uso>

  @backend
  Escenario: <flujo principal, visto desde el backend>
    Dado <la situación de partida>
    Cuando <la acción del actor>
    Entonces <el resultado comprobable>

  @backend
  Escenario: <error esperado>
    Dado <la situación que provoca el error>
    Cuando <la acción del actor>
    Entonces <se rechaza con el error CODIGO_DE_ERROR>
    Y <lo que no cambia>

  @web
  Escenario: <qué ve el usuario ante el error>
    Dado que el backend rechaza la operación con CODIGO_DE_ERROR
    Cuando <la acción del usuario>
    Entonces ve el mensaje "<texto de error.CODIGO_DE_ERROR en spec/textos/>"

  @e2e
  Escenario: <el actor completa el caso de uso de principio a fin>
    Dado <la situación de partida>
    Cuando <las acciones del actor>
    Entonces <el resultado que ve>
