#!/usr/bin/env bash
#
#
# Dependencies: tor secure-delete curl wget xq bleachbit zenity



BLUE='\033[1;94m'
GREEN='\033[1;92m'
RED='\033[1;91m'
RESETCOLOR='\033[1;00m'


if [ $(id -u) -ne 0 ]; then
	echo;echo -e "${RED}Sorry, you must be root to run this script. Exiting...${RESETCOLOR}";echo
	exit 1
fi

DISTRO=`awk -F'=' '/^ID=/ {print tolower($2)}' /etc/*-release 2> /dev/null`
echo;echo -e "${GREEN}>>> Detected distribution: ${DISTRO}${RESETCOLOR}"


echo;echo -e "${GREEN}>>> Installing dependencies${RESETCOLOR}"

### Ubuntu
if [ $DISTRO == "ubuntu" ]; then
	apt install tor secure-delete curl wget xq bleachbit zenity
#### Debian(-based) systems
elif [ $DISTRO == "debian" ]; then
	apt install tor secure-delete curl wget xq bleachbit zenity
### Downstream Debian, like Kali
elif [ $DISTRO == "kali" ]; then
	apt install tor secure-delete curl wget xq bleachbit zenity
else
	echo "Unsupported Linux distro: $DISTRO. Exiting..."
	exit 1
fi


echo;echo -e "${GREEN}>>> Building package anonsurf.deb${RESETCOLOR}"
dpkg-deb -b anonsurf-deb-src/ /tmp/anonsurf.deb


#echo;echo -e "${GREEN}>>> Installing Anonsurf${RESETCOLOR}"
#dpkg -i /tmp/anonsurf.deb || (apt-get -f install && dpkg -i /tmp/anonsurf.deb) 


echo "All done."
exit 0
