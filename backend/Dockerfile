# == Build Stage =================
FROM maven:3.8-openjdk-17-slim AS build

WORKDIR /app

COPY . .

ARG SPRING_PROFILES_ACTIVE=prod
ENV SPRING_PROFILES_ACTIVE=$SPRING_PROFILES_ACTIVE

RUN mvn clean package -DskipTests
# == Production Stage ============
FROM openjdk:17-jdk-slim

COPY --from=build /app/target/demo-0.5.0-SNAPSHOT.jar /app/demo-0.5.0-SNAPSHOT.jar

EXPOSE 8080

CMD ["java", "-jar", "/app/demo-0.5.0-SNAPSHOT.jar"]
