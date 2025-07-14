#!/usr/bin/env bash
#
#
# Dependencies: tor secure-delete curl wget xq bleachbit zenity iptables



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

### Ubuntu/Debian/Kali, all fine
if [ $DISTRO == "ubuntu" || $DISTRO == "debian" || $DISTRO == "kali" ]; then
	apt install tor secure-delete curl wget xq bleachbit zenity iptables iptables-persistent
else
	# Not fine
	echo "Error: unsupported Linux distro: $DISTRO. Please consider using Debian. Exiting..."
	exit 1
fi


echo "All done."
exit 0
