# FROM openjdk:18

# EXPOSE 8081

# ARG JAR_FILE=build/libs/ChatApp-0.0.1-SNAPSHOT.jar

# ADD ${JAR_FILE} ChatApp.jar

# ENTRYPOINT ["java", "-jar", "/ChatApp.jar"]
# BUILD
FROM openjdk:18 AS build
WORKDIR /app
COPY . .
RUN ./gradlew build

# RUN
FROM openjdk:18
WORKDIR /app
EXPOSE 8081

ARG JAR_FILE=build/libs/ChatApp-0.0.1-SNAPSHOT.jar
COPY --from=build /app/${JAR_FILE} ChatApp.jar

ENTRYPOINT ["java", "-jar", "/app/ChatApp.jar"]
