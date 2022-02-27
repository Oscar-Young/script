#!/bin/bash
# 2021/01/10 OscarYoung

source /etc/os-release

if [ "$NAME" != 'Ubuntu' ]
then
  echo "$NAME:$VERSION is not support"
  exit 1
fi

if [ "$VERSION" == '18.04' ] && [ "$VERSION" == '20.04' ]
then
  echo "$NAME:$VERSION is not support"
  exit 1
fi

curl https://packages.microsoft.com/config/ubuntu/18.04/multiarch/prod.list > ./microsoft-prod.list && \
sudo cp ./microsoft-prod.list /etc/apt/sources.list.d/ && \
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg && \
sudo cp ./microsoft.gpg /etc/apt/trusted.gpg.d/ && \
sudo apt update && \
sudo apt -y install moby-engine && \
sudo apt install -y aziot-edge