#!/usr/bin/bash

# MongoDB OSX Launchctl демон
# 
# Автор: Andrei Railean (http://andrei.md)
# 
# Локализация на русский и допиливание под монгу устанавливаемую из brew: kodji
if [[ `whoami` != "root" ]]; then
  echo "Скрипт необходимо запустить из-под рута"
  exit
fi

echo "Устанавливаю MongoDB демона";

# создаем папки
sudo mkdir -p /usr/local/var/db/mongodb
sudo mkdir -p /usr/local/var/log/
sudo touch /usr/local/var/log/mongodb.log

# copy PLIST and (re)install it
sudo cp org.mongo.mongod.plist /System/Library/LaunchDaemons/.
sudo chown root:wheel /System/Library/LaunchDaemons/org.mongo.mongod.plist
sudo launchctl stop org.mongo.mongod
sudo launchctl unload /System/Library/LaunchDaemons/org.mongo.mongod.plist
sudo launchctl load /System/Library/LaunchDaemons/org.mongo.mongod.plist
sudo launchctl start org.mongo.mongod

echo "Усё готово, шеф!";
