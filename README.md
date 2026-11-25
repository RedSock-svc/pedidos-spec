# pedidos-spec

Producto de prueba del piloto de la factory: pedidos online con control de stock.

Repo de especificación del producto `pedidos`: qué debe hacer y cómo se comunican sus componentes. Es la fuente de verdad del producto; los repos de componente no copian nada de aquí, solo indican en su `factory.yaml` qué versión siguen.

## Qué hay en cada carpeta

| Ruta | Qué contiene |
|---|---|
| `producto.yaml` | Componentes, contratos que expone o consume cada uno y dependencias externas |
| `.github/` | `CODEOWNERS`, con el equipo que aprueba cada parte, y la plantilla de PR |
| `spec/casos-de-uso/` | Una carpeta por caso de uso, `CU-001-<nombre>/`, con todo lo suyo: `caso-de-uso.md` (con su cabecera de datos), `aceptacion.feature`, `interfaz.md` e `imagenes/` |
| `spec/dominio/` | Un archivo por módulo del dominio con sus entidades y la clase de cada dato, y el glosario común |
| `spec/reglas/` | Reglas de negocio (`RN-001`), un archivo por módulo |
| `spec/textos/` | Textos que ve el usuario, un archivo por módulo más `comunes.yaml` |
| `spec/contratos/` | OpenAPI y AsyncAPI, con la versión mayor en el nombre: `pedidos-api.v1.openapi.yaml` |
| `spec/requisitos/` | Requisitos no funcionales: la línea base (`base.yaml`) y los del producto (`no-funcionales.yaml`) |
| `docs/arquitectura.md` | Mapa del producto |
| `docs/adr/` | Decisiones que afectan a más de un componente |
| `docs/seguridad/amenazas.md` | Modelo de amenazas |
| `docs/incidentes/` | Análisis de incidentes en producción |
| `docs/plantillas/` | Modelos de documento: la carpeta de un caso de uso y el ADR |
| `e2e/` | Tests end-to-end del producto completo y sus datos sintéticos |

Los modelos de `docs/plantillas/` se copian a su sitio con el nombre definitivo y no se editan. Están fuera de `spec/` para que los controles y los componentes no los tomen por especificación real.

Los identificadores (`CU-`, `RN-`, `RNF-`) y las claves de los textos son únicos en todo el producto, aunque estén repartidos en archivos por módulo.

## Orden para especificar una funcionalidad

1. **Caso de uso**: copiar `docs/plantillas/caso-de-uso/` a `spec/casos-de-uso/CU-00N-<nombre>/`, rellenar la cabecera y el texto de `caso-de-uso.md`.
2. **Glosario y modelo**: añadir los términos nuevos al glosario y los datos nuevos al archivo de su módulo, cada uno con su clase. Si el caso de uso abre un módulo nuevo, crear su archivo en `spec/dominio/`, `spec/reglas/` y `spec/textos/`.
3. **Reglas de negocio** que aplica, con su identificador `RN-`, en el archivo de su módulo.
4. **Contratos** que cambian.
5. **Escenarios** en `aceptacion.feature`: al menos uno para el flujo principal y uno por cada error, cada uno con su etiqueta.
6. **Requisitos no funcionales** que le aplican, medibles.
7. **Interfaz**, si interviene un componente con interfaz: pantallas y flujo en `interfaz.md`, y textos en `spec/textos/`. Si no, borrar `interfaz.md`.
8. Revisar la lista *Cuándo está lista* del caso de uso, abrir el PR y publicar una versión.

## Versiones

El repo se versiona con semver: parche (redacción), menor (casos de uso, escenarios o contratos nuevos que conviven con los anteriores) y mayor (retirar un contrato o un cambio incompatible).
