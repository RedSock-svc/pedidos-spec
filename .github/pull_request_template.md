## Qué cambia y por qué

<!-- En pocas frases. Si es una aclaración, qué duda resuelve. -->

## Identificadores

<!-- Los que cubre el cambio: CU-001, RN-003, RNF-001, ADR-002, TAREA-123… -->

## Tipo de cambio en la especificación

- [ ] Aclaración ligera: solo escenarios, redacción o glosario de un caso de uso existente, sin tocar su cabecera
- [ ] Parche: corrección de redacción, sin cambiar el comportamiento
- [ ] Menor: casos de uso, escenarios, campos o versiones de contrato nuevos que conviven con lo anterior
- [ ] Mayor: retira una versión de un contrato o cambia algo de forma incompatible

## Riesgo

- [ ] Añade o cambia datos de clase `personal` o `sensible`, o su retención → **necesita Seguridad**
- [ ] Añade o cambia requisitos no funcionales → **necesita Producto y Arquitectura del producto**, y Seguridad si son de seguridad o privacidad
- [ ] Añade una amenaza, o acepta una sin mitigar con un ADR → **necesita Seguridad**
- [ ] Añade un sistema externo o un contrato público → **necesita Arquitectura**
- [ ] Ninguno de los anteriores

`CODEOWNERS` pide la aprobación según los archivos tocados; las casillas marcadas arriba se piden además a mano.
Si hacen falta tres roles o más, se revisa en una sesión conjunta.

## Lista de comprobación

- [ ] Cada caso de uso nuevo o cambiado cumple su lista *Cuándo está lista*
- [ ] Los términos nuevos están en el glosario y los datos nuevos tienen su clase
- [ ] Los códigos de error nuevos de los contratos tienen su texto en `spec/textos/`
- [ ] La memoria está al día: mapa del producto, ADRs y modelo de amenazas, si el cambio les afecta
- [ ] Si interviene una interfaz: pantallas con sus estados (cargando, vacío, error, éxito) y textos sin escribir en el código *(lista de Diseño)*

## Controles

<!-- Los resultados aparecen en el PR. Si alguno no aplica o tiene una excepción, explica aquí por qué. -->
