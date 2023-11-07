FROM openjdk:18
MAINTAINER baeldung.com
COPY target/quarkus-app/app app
COPY target/quarkus-app/lib lib
COPY target/quarkus-app/quarkus quarkus
COPY target/quarkus-app/quarkus-run.jar app.jar
expose 8080
ENTRYPOINT ["java","-jar","/app.jar"]
