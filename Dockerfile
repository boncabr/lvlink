FROM eclipse-temurin:17-jre-alpine

RUN apk add --no-cache curl

WORKDIR /app

RUN curl -L -o Lavalink.jar \
    https://github.com/lavalink-devs/Lavalink/releases/download/4.2.2/Lavalink.jar

COPY lavalink/application.yml application.yml
COPY lavalink/plugins/ plugins/

EXPOSE 8099

CMD ["java", "-Xmx512m", "-jar", "Lavalink.jar"]
