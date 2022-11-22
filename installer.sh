#!/usr/bin/env bash

BLUE='\033[1;94m'
GREEN='\033[1;92m'
RED='\033[1;91m'
RESETCOLOR='\033[1;00m'
APTSRC="/etc/apt/sources.list.d/i2p.list"
KEYFILE="/tmp/i2p-archive-keyring.gpg"


if [ $(id -u) -ne 0 ]; then
	echo;echo -e "${RED}Sorry, you must be root to run this script.${RESETCOLOR}";echo
	exit 1
fi


#echo;echo -e "${GREEN}>>> Installing dependencies.${RESETCOLOR}"
#apt update
#apt install -y apt-transport-https curl wget


echo;echo -e "${GREEN}>>> Adding I2P repo to APT sources.${RESETCOLOR}"
if [[ -f ${APTSRC} ]] ; then
   rm -f ${APTSRC}
fi
echo "deb https://deb.i2p2.de/ unstable main" | tee /etc/apt/sources.list.d/i2p.list
curl -o ${KEYFILE} https://geti2p.net/_static/i2p-archive-keyring.gpg
cp ${KEYFILE} /usr/share/keyrings


#echo;echo -e "${GREEN}>>> Installing Anonsurf dependencies.${RESETCOLOR}"
#apt-get update
#apt install -y tor i2p i2p-keyring i2p-router secure-delete wget xq bleachbit
#apt --fix-broken install 


echo;echo -e "${GREEN}>>> Building package anonsurf.deb.${RESETCOLOR}"
dpkg-deb -b anonsurf-deb-src/ /tmp/anonsurf.deb


echo;echo -e "${GREEN}>>> Installing Anonsurf.${RESETCOLOR}"
#dpkg -i /tmp/anonsurf.deb || (apt-get -f install && dpkg -i /tmp/anonsurf.deb) 


echo "All done."
exit 0
