FROM openjdk:17-jdk-slim

WORKDIR /app

COPY target/*.jar app.jar

EXPOSE 8989

CMD ["java", "-jar", "/app/app.jar"]