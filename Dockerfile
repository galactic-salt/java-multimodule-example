FROM maven:3.6.0-jdk-12-alpine as builder
WORKDIR /work
# copy poms and cache dependencies
ADD pom.xml .
ADD example-bom/pom.xml example-bom/pom.xml
ADD example-models/pom.xml example-models/pom.xml
ADD example-web-server/pom.xml example-web-server/pom.xml
RUN mvn -T 1C -DskipTests verify
COPY . .
RUN mvn -T 1C -DskipTests package -offline

FROM openjdk:12-alpine
WORKDIR /work
COPY --from=builder /work/example-web-server/target/example-web-server.jar .
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "example-web-server.jar"]
