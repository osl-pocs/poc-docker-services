# Proyecto de Levantamiento de Contenedores MongoDB
Este proyecto consiste en proporcionar una manera fácil y rápida de levantar contenedores de MongoDB utilizando imágenes latest y alpine. Está diseñado para ser altamente personalizable utilizando variables de entorno, y también incluye atajos útiles mediante un archivo Makefile.

## Requisitos
* Docker instalado en tu sistema.
* GNU Make para utilizar los atajos proporcionados en el archivo Makefile.

## Uso
1. Clona este repositorio en tu máquina local:
2. Personaliza tus variables de entorno si es necesario.
3. Levanta el contenedor de MongoDB utilizando los atajos de Makefile


Si necesitas una guia con los atajos puedes usar:

``` Makefile
make help
```

## Variables de entorno

### Configuración del Contenedor MongoDB
* MONGO_CONTAINER_NAME: El nombre que se asignará al contenedor de MongoDB cuando se levante.
* MONGO_CONTAINER_PORT: El puerto en el que el contenedor de MongoDB estará escuchando las conexiones.
* MONGO_CONTAINER_IMAGE: La imagen de Docker utilizada para el contenedor de MongoDB, puede ser latest, alpine u otra versión específica.
* MONGO_CONTAINER_VOLUME: La ruta del volumen que se montará.
### Configuración de la Inicialización de MongoDB
* MONGO_INITDB_ROOT_USERNAME: El nombre de usuario utilizado para la autenticación.
* MONGO_INITDB_ROOT_PASSWORD: La contraseña utilizada para la autenticación.
* MONGO_INITDB_DATABASE: El nombre de la base de datos que se creará inicialmente.
### Configuración de la Red
NETWORK: El nombre de la red Docker.