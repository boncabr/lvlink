FROM eclipse-temurin:17-jre-alpine

RUN apk add --no-cache wget libgcc libstdc++

WORKDIR /app

RUN mkdir -p plugins && \
    wget -q -O Lavalink.jar \
        "https://github.com/lavalink-devs/Lavalink/releases/download/4.2.2/Lavalink.jar" && \
    ls -lh *.jar

COPY lavalink/application.yml application.yml

EXPOSE 8099

CMD ["java", "-Xmx512m", "-jar", "Lavalink.jar"]
