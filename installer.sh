#!/usr/bin/env bash
#
#
# Dependencies: tor i2p i2p-keyring i2p-router secure-delete curl wget xq bleachbit



BLUE='\033[1;94m'
GREEN='\033[1;92m'
RED='\033[1;91m'
RESETCOLOR='\033[1;00m'
APTSRC="/etc/apt/sources.list.d/i2p.list"
KEYFILE="/tmp/i2p-archive-keyring.gpg"


if [ $(id -u) -ne 0 ]; then
	echo;echo -e "${RED}Sorry, you must be root to run this script. Exiting...${RESETCOLOR}";echo
	exit 1
fi

DISTRO=`awk -F'=' '/^ID=/ {print tolower($2)}' /etc/*-release 2> /dev/null`
echo;echo -e "${GREEN}>>> Detected distribution: ${DISTRO}${RESETCOLOR}"


echo;echo -e "${GREEN}>>> Adding I2P repo to APT sources${RESETCOLOR}"
if [[ -f ${APTSRC} ]] ; then
   rm -f ${APTSRC}
fi

### Ubuntu
if [ $DISTRO == "ubuntu" ]; then
	apt-add-repository ppa:i2p-maintainers/i2p
#### Debian(-based) systems
elif [ $DISTRO == "debian" ]; then
	curl -o ${KEYFILE} https://geti2p.net/_static/i2p-archive-keyring.gpg
	cp ${KEYFILE} /usr/share/keyrings/
	sudo apt-get update
	sudo apt-get install apt-transport-https lsb-release curl
	echo "deb [signed-by=/usr/share/keyrings/i2p-archive-keyring.gpg] https://deb.i2p2.de/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/i2p.list
### Downstream Debian, like Kali
elif [ $DISTRO == "kali" ]; then
	curl -o ${KEYFILE} https://geti2p.net/_static/i2p-archive-keyring.gpg
	cp ${KEYFILE} /usr/share/keyrings/
	echo "deb [signed-by=/usr/share/keyrings/i2p-archive-keyring.gpg] https://deb.i2p2.de/ $(dpkg --status tzdata | grep Provides | cut -f2 -d'-') main"  | sudo tee /etc/apt/sources.list.d/i2p.list
else
	echo "Unsupported Linux distro: $DISTRO. Exiting..."
	exit 1
fi


echo;echo -e "${GREEN}>>> Installing I2P${RESETCOLOR}"
apt update
apt install --fix-broken
apt install -y i2p ip2-router


echo;echo -e "${GREEN}>>> Building package anonsurf.deb${RESETCOLOR}"
dpkg-deb -b anonsurf-deb-src/ /tmp/anonsurf.deb


echo;echo -e "${GREEN}>>> Installing Anonsurf${RESETCOLOR}"
dpkg -i /tmp/anonsurf.deb || (apt-get -f install && dpkg -i /tmp/anonsurf.deb) 


echo "All done."
exit 0
