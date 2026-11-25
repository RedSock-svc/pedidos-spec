# ADR-001: Aceptar sin mitigar los pedidos masivos durante el piloto

- Estado: aceptado
- Fecha: 2026-11-25
- Aprobado por: Seguridad, 2026-11-25

## Contexto

Un cliente, o un bot con la cuenta de un cliente, puede hacer muchos pedidos seguidos y agotar el stock de un producto para que nadie más pueda pedirlo (amenaza 4 de `docs/seguridad/amenazas.md`). CU-001 no lo impide: cualquier pedido con stock suficiente se confirma.

Una amenaza que se acepta sin mitigar necesita un ADR que lo justifique.

`pedidos` es el producto de prueba del piloto de la factory: no tiene usuarios reales, no llega a producción y sus datos son sintéticos.

## Decisión

Se acepta la amenaza sin mitigar **mientras `pedidos` sea un producto de prueba**. Antes de que cualquier componente de `pedidos` llegue a producción, este ADR se revisa y se reemplaza por uno que decida la mitigación.

## Alternativas descartadas

- **Un máximo de unidades por pedido** (por ejemplo, 10). Es una regla nueva (`RN-005`) con su error, su texto y sus escenarios en el backend y en la web. Hace más grande el único caso de uso del piloto, cuyo objetivo es recorrer la factory con lo mínimo, y no protege del todo: el bot puede hacer muchos pedidos pequeños.
- **Un límite de pedidos por cliente y periodo.** Protege mejor, pero exige guardar el historial de pedidos de cada cliente y decidir cifras sin datos de uso reales.
- **Limitar las peticiones en la entrada de la plataforma** (*rate limiting*). Es la mitigación más probable a largo plazo, pero depende de la plataforma de entornos, que en el piloto es provisional (decisión 6).

## Consecuencias

- En los entornos del piloto, un cliente puede agotar el stock con pedidos masivos. No afecta a nadie porque no hay usuarios reales.
- La amenaza 4 del modelo de amenazas enlaza con este ADR, aceptada por Seguridad.
- Antes de producción hay que volver a decidir, probablemente con limitación de peticiones en la plataforma y, si hace falta, una regla de negocio.
