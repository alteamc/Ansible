#!/usr/bin/env bash

while true
do
java -Dfile.encoding=UTF-8 -jar -Xmx6G -Xms6G ./server.jar nogui
echo "If you want to completely stop the server now, press Ctrl+C before time is up!"
echo "Automated realoading in:"
for i in 5 4 3 2 1
do
echo "$i..."
sleep 1
done
echo "Reloading"
done
