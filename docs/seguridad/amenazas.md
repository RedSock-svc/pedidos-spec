# Modelo de amenazas de pedidos

Qué puede salir mal, quién podría provocarlo y qué lo impide. Lo aprueba Seguridad. Se actualiza al añadir un componente, un sistema externo, un contrato público o datos personales o sensibles.

<!-- El formato (por ejemplo, STRIDE) es una decisión pendiente de la factory. -->

| # | Amenaza | Quién | Qué la impide | Estado |
|---|---|---|---|---|
| 1 | Crear pedidos a nombre de otro cliente | Un cliente malintencionado | El titular sale del token, nunca de la petición (`RN-003`), con su escenario | Mitigada |
| 2 | Usar la API sin identificarse | Cualquiera | Todas las operaciones exigen token (`NO_IDENTIFICADO`); se deniega por defecto | Mitigada |
| 3 | Dejar el stock en negativo con pedidos simultáneos o cantidades negativas | Un cliente, a propósito o no | `RN-001` y `RN-002`, con sus escenarios de concurrencia y de cantidad | Mitigada |
| 4 | Agotar el stock con pedidos masivos | Un cliente o un bot | Nada durante el piloto: se acepta sin mitigar mientras `pedidos` sea de prueba (`docs/adr/ADR-001-aceptar-pedidos-masivos-en-el-piloto.md`) | Aceptada (ADR-001) |
| 5 | Saber qué compró un cliente a partir de su `idCliente`, que es un dato personal | Quien acceda a logs, trazas o copias de datos | `idCliente` no se escribe en logs ni trazas (`RNF-BASE-002`), los entornos de prueba solo usan datos sintéticos y los pedidos se anonimizan con el tiempo (`RNF-003`). Antes de producción falta el borrado a petición del titular, con su propio caso de uso | Mitigada en el piloto; falta el borrado a petición |
