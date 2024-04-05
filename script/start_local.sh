#!/bin/sh

##########
# ENV
##########

export IMAGE_NAME='cdd/eureka-server'
export TAG_NAME='0.0.1'
export DOCKER_CONTAINER_NAME='cdd_eureka_server'

##########
# BootJar
##########

echo '🚀 Start Eureka Quick Starter'

cd ..

echo '\n🗄️Start Create Boot Jar'

chmod 755 gradlew
./gradlew clean bootJar

##########
# Docker Local Image Build
##########
cd script
sh build_local_image.sh

##########
# Start Docker Image
##########

echo '\n🐬Start Local Docker Container'

docker rm -f $DOCKER_CONTAINER_NAME

docker run -d \
-e PROFILE=local \
--name $DOCKER_CONTAINER_NAME \
-p 8761:8761 \
$IMAGE_NAME:$TAG_NAME