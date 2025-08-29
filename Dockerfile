  # Spring Boot (Maven) - multi-stage
  FROM maven:3.9.6-eclipse-temurin-17 AS build
  WORKDIR /src
  COPY . .
  WORKDIR /src
  RUN mvn -B -DskipTests clean package

  FROM eclipse-temurin:17-jre
  WORKDIR /app
  COPY --from=build /src/target/*.jar app.jar
  EXPOSE 8080
  ENTRYPOINT ["java","-jar","/app/app.jar"]
