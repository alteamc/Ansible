#!/usr/bin/env bash

DATE=$(date +"%Y-%m-%d")
TIME=$(date +"%T")

echo $DATE
echo $TIME "If you want to cancel the restart, press Ctrl+C"
screen -S mc -X -p0 stuff $'save-all\n'
echo $TIME "Сохранение мира"
screen -S mc -X -p0 stuff $'say Профилактическая перезагрузка через 60 секунд!\n'
echo $TIME "Профилактическая перезагрузка через 60 секунд!"
sleep 30
screen -S mc -X -p0 stuff $'say Профилактическая перезагрузка через 30 секунд!\n'
echo $TIME "Профилактическая перезагрузка через 30 секунд!"
sleep 20
for i in {10..1}; do
screen -S mc -X -p0 stuff $'say Профилактическая перезагрузка через '$i' секунд!\n'
echo $TIME "Профилактическая перезагрукза через $i секунд!"
sleep 1
done
screen -S mc -X -p0 stuff $'say Сервер ушел на профилактическую перезагрузку!\n'
echo $TIME "Сервер ушел на профилактическую перезагрузку"
sleep 1
screen -S mc -X -p0 stuff $'save-all\n'
echo $TIME "Сохранение мира"
screen -S mc -X -p0 stuff $'stop\n'
echo $TIME "Остановка сервера"
