#!/bin/sh
echo Building nodewebapp from Secondfile.dev

docker build -t nodeapp:2dev -f secondfile.dev .

echo Creating Conatiner Out of Image
docker container create --name extract nodeapp:2dev
docker container cp extract:/usr/src/app/WebApp/dist ./dist
docker container rm -f extract

echo Building nodewebapp version 2

docker build --no-cache -t nodeapp:2prod -f secondfile.prod .
rm -rf ./dist
