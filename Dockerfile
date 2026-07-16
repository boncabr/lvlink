FROM eclipse-temurin:17-jre-alpine

RUN apk add --no-cache wget

WORKDIR /app

RUN mkdir -p plugins && \
    wget -q --show-progress \
        -O Lavalink.jar \
        "https://github.com/lavalink-devs/Lavalink/releases/download/4.2.2/Lavalink.jar" && \
    wget -q -O plugins/youtube-plugin-1.18.1.jar \
        "https://github.com/lavalink-devs/youtube-source/releases/download/1.18.1/youtube-plugin-1.18.1.jar" && \
    wget -q -O plugins/sponsorblock-plugin-3.0.1.jar \
        "https://github.com/topi314/sponsorblock-plugin/releases/download/3.0.1/sponsorblock-plugin-3.0.1.jar" && \
    ls -lh *.jar plugins/

COPY lavalink/application.yml application.yml

EXPOSE 8099

ENV SERVER_PORT=8099

CMD ["java", "-Xmx512m", "-jar", "Lavalink.jar"]
