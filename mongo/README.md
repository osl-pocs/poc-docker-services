# MongoDB Container Lifting Project
This project is about providing a quick and easy way to build MongoDB containers using latest and alpine images. It is designed to be highly customizable using environment variables, and also includes useful shortcuts using a Makefile.

## Requirements
* Docker installed on your system.
* GNU Make to use the shortcuts provided in the Makefile.

## Use
1. Clone this repository
2. Customize your environment variables
3. Raise MongoDB container using Makefile shortcuts


If you need a guide with the shortcuts you can use:

``` Makefile
make help
```

## Environment Variables

### MongoDB Container Configuration
* MONGO_CONTAINER_NAME: The name that will be assigned to the MongoDB container when it is raised.
* MONGO_CONTAINER_PORT: The port on which the MongoDB container will be listening for connections.
* MONGO_CONTAINER_< >_TAG: The Docker image used for the MongoDB container, it can be latest, alpine or another specific version, into < >.
### Configuring MongoDB Initialization
* MONGO_INITDB_ROOT_USERNAME: The username used for authentication.
* MONGO_INITDB_ROOT_PASSWORD: The password used for authentication.
* MONGO_INITDB_DATABASE: The name of the database to be created initially.
### Network settings
NETWORK: Name of the Docker network.
