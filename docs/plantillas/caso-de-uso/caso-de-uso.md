---
# Datos del caso de uso que leen los controles, el registro y los agentes. Es la única copia de estos datos:
# el texto de abajo no los repite.
id: CU-00N
nombre: <Nombre del caso de uso>
modulo: <módulo del dominio>              # un archivo de spec/dominio/
actor: <Cliente, Administrador, otro sistema…>
componentes: [backend, web]               # los que intervienen, tal como se llaman en producto.yaml
flag:
  nombre: CU-00N-<nombre>                 # el mismo que el nombre de esta carpeta
  retirada: AAAA-MM-DD
reglas: [RN-00N]                          # reglas de spec/reglas/ que aplica
requisitos: [RNF-00N]                     # requisitos no funcionales que le aplican, además de la línea base
contratos: [<producto>-api.v1]            # contratos que usa o cambia
---

# CU-00N: <Nombre del caso de uso>

<!--
Copia la carpeta docs/plantillas/caso-de-uso/ a spec/casos-de-uso/ con el nombre CU-00N-<nombre-en-minusculas>/
y rellena cada archivo. Si ningún componente con interfaz interviene, borra interfaz.md.
Lo que no sepas no se inventa: se deja como pregunta abierta al final y el caso de uso no está listo.
-->

**Objetivo:** qué consigue el actor, en una frase.

## Precondiciones

- Qué debe ser cierto antes de empezar. Por ejemplo: el cliente está identificado.

## Flujo principal

1. El actor…
2. El sistema…
3. …

**Resultado:** cómo queda el sistema al terminar bien.

## Flujos alternativos

### A1. <Nombre> (en el paso N)

- **Cuándo:** la condición que lo provoca.
- **Qué pasa:** qué hace el sistema y con qué código de error, si lo hay (`ERROR_EN_MAYUSCULAS`).
- **Resultado:** cómo queda el sistema.

## Cambios en los contratos

| Contrato | Operación o evento | Cambio |
|---|---|---|
| `<producto>-api.v1` | `POST /recurso` | Nueva |

## Preguntas abiertas

- Ninguna. *(Si hay alguna, el caso de uso no está listo.)*

## Cuándo está lista

- [ ] No quedan preguntas abiertas.
- [ ] La cabecera está completa: actor, componentes, flag, reglas, requisitos y contratos.
- [ ] Objetivo, flujo principal y flujos alternativos escritos.
- [ ] `aceptacion.feature` tiene al menos un escenario para el flujo principal y uno por cada error, cada uno con su etiqueta.
- [ ] Las reglas de negocio que aplica están escritas y tienen identificador.
- [ ] Los contratos que cambian están actualizados.
- [ ] Los términos nuevos están en el glosario y los datos nuevos tienen su clase.
- [ ] Los requisitos no funcionales que le aplican están escritos y son medibles.
- [ ] Si interviene un componente con interfaz, `interfaz.md` tiene sus pantallas y su flujo, y los textos están en `spec/textos/`.
- [ ] Aprobada y publicada en una versión de este repo.
