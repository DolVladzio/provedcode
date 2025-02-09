# == Build Stage =================
FROM maven:3.8-openjdk-17-slim AS build

WORKDIR /app

COPY . .

RUN mvn clean package
# == Production Stage ============
FROM openjdk:17-jdk-slim

COPY --from=build /app/target/demo-0.5.0-SNAPSHOT.jar /app/demo-0.5.0-SNAPSHOT.jar

EXPOSE 8080

CMD ["java", "-jar", "/app/demo-0.5.0-SNAPSHOT.jar"]
