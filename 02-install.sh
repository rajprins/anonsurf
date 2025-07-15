#!/usr/bin/env bash


BLUE='\033[1;94m'
GREEN='\033[1;92m'
RED='\033[1;91m'
RESETCOLOR='\033[1;00m'
TARGET=anonsurf.deb


echo -e "${GREEN}>>> Enter your password:${RESETCOLOR}"
sudo -v

#echo "Apt::Cmd::Disable-Script-Warning true;" | sudo tee /etc/apt/apt.conf.d/90disablescriptwarning

echo
echo -e "${GREEN}>>> Installing package $TARGET:${RESETCOLOR}"
sudo dpkg -i ${TARGET}


