FROM eclipse-temurin:21-jre-alpine

WORKDIR /app

RUN apk add --no-cache wget

RUN wget -O Lavalink.jar https://github.com/lavalink-devs/Lavalink/releases/download/4.2.2/Lavalink.jar

COPY application.yml .

EXPOSE 2333

CMD ["java", "-XX:+UseG1GC", "-Xms512m", "-Xmx768m", "-Dfile.encoding=UTF-8", "-jar", "Lavalink.jar"]
