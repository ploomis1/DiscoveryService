#!/bin/sh

# Check if autosurvey-network network exists
if [ -z "$(docker network ls -q -f name=dmv-network)" ]; then
    docker network create dmv-network
fi

# rm discovery-service container if it exists
if [ -n "$(docker container ls -aqf name=discovery-service)" ]; then
    docker container stop discovery-service
    docker container rm discovery-service
fi

#start discovery-service container
docker container run -d --name discovery-service --network dmv-network \
    -p 8761:8761 dmv/discovery-service

#Changed permission