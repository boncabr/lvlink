FROM eclipse-temurin:21-jre-alpine

WORKDIR /opt/Lavalink

RUN apk add --no-cache wget libgcc && \
    wget -O Lavalink.jar https://github.com/lavalink-devs/Lavalink/releases/download/4.2.2/Lavalink.jar

COPY application.yml application.yml

EXPOSE 2333

HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
  CMD wget -qO- http://localhost:2333/v4/info || exit 1

CMD ["java", "-XX:+UseG1GC", "-Xms256m", "-Xmx512m", "-Dfile.encoding=UTF-8", "-jar", "Lavalink.jar"]
