FROM openjdk:18
MAINTAINER pasinski@gmail.com
WORKDIR ./target/quarkus-app
ADD app app
ADD lib lib
ADD quarkus quarkus
ADD quarkus-run.jar app.jar
expose 8080
ENTRYPOINT ["java","-jar","/app.jar"]
