#!/usr/bin/env bash
#
#
# Dependencies: tor secure-delete curl bleachbit iptables iptables-persistent zenity


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


### Ubuntu
if [ $DISTRO == "ubuntu" ]; then
	#apt-add-repository ppa:i2p-maintainers/i2p
	apt update
#### Debian(-based) systems
elif [ $DISTRO == "debian" ]; then
  	apt update
### Downstream Debian, like Kali, Parrot etc.
elif [ $DISTRO == "kali" ]; then
	apt update
else
	echo "Unsupported Linux distro: $DISTRO. Exiting..."
	exit 1
fi

echo;echo -e "${GREEN}>>> Installing packages${RESETCOLOR}"
apt install python3 gir1.2-gtk-4.0 secure-delete tor curl bleachbit iptables iptables-persistent -y

echo;echo "All done."
exit 0