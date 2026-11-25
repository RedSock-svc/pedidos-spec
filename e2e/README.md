# Tests end-to-end

Ejecutan los escenarios `@e2e` de cada caso de uso (`spec/casos-de-uso/*/aceptacion.feature`) con todos los componentes desplegados juntos, en el entorno de integración. Solo se ejecutan los de los casos de uso que tienen en `implementa` todos los componentes que intervienen, según el campo `componentes` de la cabecera del caso de uso; los demás solo avisan.

- `datos/`: datos sintéticos del producto con los que se cargan los entornos compartidos. Nunca datos reales de producción.

La herramienta (Playwright) y la estructura del código se añaden al implementar el primer escenario `@e2e`.
