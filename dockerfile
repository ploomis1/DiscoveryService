FROM openjdk:8-jdk-alpine
WORKDIR /app

COPY target/discovery-service.jar .

EXPOSE 8761

CMD [ "java", "-jar", "discovery-service.jar" ]
