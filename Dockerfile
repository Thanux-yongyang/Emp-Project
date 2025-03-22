# Use an official OpenJDK runtime as a base image
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the Spring Boot JAR file into the container
# Ensure that the JAR file is in the target directory (after running `mvn package` or `gradle build`)
COPY target/*.jar app.jar

# Expose the port the app will run on (default Spring Boot port is 8080)
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
