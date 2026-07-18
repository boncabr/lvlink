#!/bin/bash
if [ ! -f Lavalink.jar ]; then
  echo "Mengunduh Lavalink v4.2.2..."
  wget -O Lavalink.jar https://github.com/lavalink-devs/Lavalink/releases/download/4.2.2/Lavalink.jar
fi
echo "Menjalankan Lavalink dengan optimasi RAM..."
java -XX:+UseG1GC -Xms512m -Xmx768m -jar Lavalink.jar
