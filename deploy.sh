#!/bin/sh

##########
# ENV
##########

export EUREKA_SERVER_IMAGE_NAME="cdd/eureka-server"
export EUREKA_SERVER_TAG_NAME="0.0.1"

##########
# Build Eureka Server Image
##########

echo "\n🗑 Start Delete Docker Files"

if docker image inspect $EUREKA_SERVER_IMAGE_NAME:$EUREKA_SERVER_TAG_NAME &> /dev/null; then
    docker image rm -f $EUREKA_SERVER_IMAGE_NAME:$EUREKA_SERVER_TAG_NAME
fi

echo "\n🔨 Start Build Docker Image"

docker build \
-t $EUREKA_SERVER_IMAGE_NAME:$EUREKA_SERVER_TAG_NAME .

##########
# Eureka Server Container Start
##########

if [ "$(docker ps -aq -f name=$EUREKA_SERVER_NAME)" ]; then
    echo "🚫 Stop Docker Container : "
    docker rm -f $EUREKA_SERVER_NAME
else
    echo "🚫 There is no running container named $EUREKA_SERVER_NAME"
fi

echo "🚀 Docker $EUREKA_SERVER_NAME Container Start! : "
docker run -d \
--name $EUREKA_SERVER_NAME \
-p $EUREKA_SERVER_PORT:$EUREKA_SERVER_PORT \
-e PROFILE=$EUREKA_SERVER_PROFILE \
$EUREKA_SERVER_IMAGE_NAME:$EUREKA_SERVER_TAG_NAME