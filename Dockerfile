FROM amazoncorretto:17-alpine
LABEL MAINTAINER="KIMSEI <workju1124@gmail.com>"

ARG JAR_FILE=../build/libs/*.jar
WORKDIR /app
COPY ${JAR_FILE} eureka-server.jar

ENTRYPOINT ["java", "-jar", "-Dspring.profiles.active=${PROFILE}", "/app/eureka-server.jar"]