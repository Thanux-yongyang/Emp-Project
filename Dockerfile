# Stage 1: Build the application
FROM maven:3.8.1-openjdk-21-slim AS build
WORKDIR /app

# Copy the pom.xml and dependencies first to leverage Docker cache
COPY pom.xml ./
RUN mvn dependency:go-offline

# Copy the entire project to the container and build it
COPY . .
RUN mvn clean package -DskipTests

# Stage 2: Run the application
FROM openjdk:17-jdk-slim
WORKDIR /app

# Copy the JAR file generated from the build stage
COPY --from=build /app/target/*.jar app.jar

# Expose the port that the app will run on (default Spring Boot port is 8080)
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "app.jar"]
