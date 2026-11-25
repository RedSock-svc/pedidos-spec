# CU-00N: <Nombre del caso de uso> · Interfaz

<!--
Pantallas y flujo de navegación del caso de uso de esta carpeta. Solo si interviene un componente con interfaz.
Las pantallas se construyen con los componentes de red-ui. Las imágenes van en imagenes/, dentro de esta misma
carpeta, o se enlaza una versión fija del diseño: un enlace a un diseño que se sigue editando no vale.
Los textos no se escriben aquí: se citan por su clave de spec/textos/.
-->

## Flujo

1. `<pantalla-a>` → `<pantalla-b>` (flujo principal)
2. Si ocurre `A1`: `<pantalla-b>` → `<pantalla-error>`

## Pantalla: <nombre>

![<nombre>](imagenes/<nombre>.png)

| Estado | Qué ve el usuario |
|---|---|
| Cargando | |
| Vacío | |
| Error | Texto `error.<CODIGO>` de `spec/textos/` |
| Éxito | |

Textos que usa: `clave.del.texto`, `otra.clave`
