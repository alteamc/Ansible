#!/usr/bin/env bash
screen -S mc -X -p0 stuff $'save-all\n'
screen -S mc -X -p0 stuff $'stop\n'
sleep 3
screen -S mc -X kill

DATE=$(date +"%Y-%m-%d")
TIME=$(date +"%T")

echo $DATE
echo $TIME "If you want to cancel the restart, press Ctrl+C"
screen -S mc -X -p0 stuff $'save-all\n'
echo $TIME "Сохранение мира"
screen -S mc -X -p0 stuff $'say Остановка сервера через 60 секунд!\n'
echo $TIME "Остановка сервера через 60 секунд!"
sleep 30
screen -S mc -X -p0 stuff $'say Остановка сервера через 30 секунд!\n'
echo $TIME "Остановка сервера через 30 секунд!"
sleep 20
for i in {10..1}; do
screen -S mc -X -p0 stuff $'say Остановка сервера через '$i' секунд!\n'
echo $TIME "Остановка сервера через $i секунд!"
sleep 1
done
screen -S mc -X -p0 stuff $'say Сервер выключен!\n'
echo $TIME "Сервер выключен!"
sleep 1
screen -S mc -X -p0 stuff $'save-all\n'
echo $TIME "Сохранение мира"
screen -S mc -X -p0 stuff $'stop\n'
echo $TIME "Остановка сервера"
