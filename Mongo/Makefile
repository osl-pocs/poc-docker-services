include .env

export MONGO_CONTAINER_NAME
export MONGO_CONTAINER_ALPINE_TAG
export MONGO_CONTAINER_LATEST_TAG
export MONGO_CONTAINER_PORT
export MONGO_INITDB_ROOT_USERNAME
export MONGO_INITDB_ROOT_PASSWORD
export MONGO_INITDB_DATABASE
export NETWORK


build_mongo_alpine_image:
	docker build -t $(MONGO_CONTAINER_ALPINE_TAG) -f MongoAlpine .

build_mongo_latest_image:
	docker build -t $(MONGO_CONTAINER_LATEST_TAG) -f MongoLatest .

run_mongo_latest_container:
	docker run -p $(MONGO_CONTAINER_PORT):27017 --network $(NETWORK) \
	--name $(MONGO_CONTAINER_NAME) \
	-e MONGO_INITDB_DATABASE=$(MONGO_INITDB_DATABASE) \
	-e MONGO_INITDB_ROOT_USERNAME=$(MONGO_INITDB_ROOT_USERNAME) \
	-e MONGO_INITDB_ROOT_PASSWORD=$(MONGO_INITDB_ROOT_PASSWORD) \
	$(MONGO_CONTAINER_LATEST_TAG)

run_mongo_alpine_container:
	docker run -p $(MONGO_CONTAINER_PORT):27017 --network $(NETWORK) \
	--name $(MONGO_CONTAINER_NAME) \
	$(MONGO_CONTAINER_ALPINE_TAG)

run_detach_mongo_container:
	docker run -d -p $(MONGO_CONTAINER_PORT):27017 --name $(MONGO_CONTAINER_NAME)  \
	-e MONGO_INITDB_ROOT_USERNAME=$(MONGO_INITDB_ROOT_USERNAME) \
	-e MONGO_INITDB_ROOT_PASSWORD=$(MONGO_INITDB_ROOT_PASSWORD) \ $(MONGO_CONTAINER_TAG)

start_mongo_container:
	docker start $(MONGO_CONTAINER_NAME)

stop_mongo_container:
	docker stop $(MONGO_CONTAINER_NAME)
	
remove_mongo_container:
	docker rm $(MONGO_CONTAINER_NAME)

remove_mongo_image:
	docker rmi $(MONGO_CONTAINER_TAG)

help:
	@echo "build_mongo_alpine_image: Build the mongo alpine image"
	@echo "build_mongo_latest_image: Build the mongo latest image"
	@echo "run_mongo_latest_container: Run the mongo latest container"
	@echo "run_mongo_alpine_container: Run the mongo alpine container"
	@echo "run_detach_mongo_container: Run the mongo container in detach mode"
	@echo "start_mongo_container: Start the mongo container"
	@echo "stop_mongo_container: Stop the mongo container"
	@echo "remove_mongo_container: Remove the mongo container"
	@echo "remove_mongo_image: Remove the mongo image"
	@echo "help"