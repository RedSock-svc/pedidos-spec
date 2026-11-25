# Módulo: catalogo

Los productos que se pueden pedir y su stock. Formato y clases de dato en `README.md`.

## Entidad: Producto

| Atributo | Tipo | Clase | Descripción |
|---|---|---|---|
| id | identificador | público | |
| nombre | texto, 1 a 100 caracteres | público | |
| precio | entero ≥ 0, céntimos de euro | público | Precio actual por unidad |
| stock | entero ≥ 0 | interno | Unidades disponibles para pedir (`RN-001`) |

## Eventos de dominio

Ninguno por ahora.
