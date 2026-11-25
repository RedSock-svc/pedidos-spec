# Textos

Todos los textos que ve el usuario. Los componentes con interfaz los obtienen de aquí en lugar de escribirlos en el código, y los escenarios `@web` citan estos mismos textos.

- **Un archivo por módulo** (`<modulo>.yaml`) y `comunes.yaml` para lo que comparten varios módulos, como los errores generales.
- **Las claves son únicas en todo el producto.** El componente junta todos los archivos; una clave repetida es un error.
- **Cada error tiene su texto**: todo código de error de un contrato que consume un componente con interfaz tiene la clave `error.<CODIGO>` en algún archivo.
- Los valores entre llaves (`{unidades}`) los rellena el componente.
