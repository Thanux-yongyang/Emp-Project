# Stage 1: Build the application
FROM maven:3.9.9-eclipse-temurin-21-jammy AS BUILD_IMAGE
WORKDIR /app

# Copy the pom.xml and dependencies first to leverage Docker cache
COPY pom.xml ./
RUN mvn dependency:go-offline

# Copy the entire project to the container and build it
COPY . .
RUN mvn clean package -DskipTests

# Stage 2: Run the application
FROM tomcat:10-jdk21
WORKDIR /app

# Copy the JAR file generated from the build stage
COPY --from=BUILD_IMAGE /app/target/*.jar app.jar

# Expose the port that the app will run on (default Spring Boot port is 8080)
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "app.jar"]
