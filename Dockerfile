FROM eclipse-temurin:17-jre-alpine

WORKDIR /app

COPY lavalink/Lavalink.jar Lavalink.jar
COPY lavalink/application.yml application.yml
COPY lavalink/plugins/ plugins/

EXPOSE 8099

CMD ["java", "-Xmx512m", "-jar", "Lavalink.jar"]
