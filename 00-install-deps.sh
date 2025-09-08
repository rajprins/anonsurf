#!/usr/bin/env bash
#
#
# Dependencies: tor secure-delete curl bleachbit iptables iptables-persistent zenity


BLUE='\033[1;94m'
GREEN='\033[1;92m'
RED='\033[1;91m'
RESETCOLOR='\033[1;00m'


echo -e "${GREEN}>>> Enter your password:${RESETCOLOR}"
sudo -v

DISTRO=`awk -F'=' '/^ID=/ {print tolower($2)}' /etc/*-release 2> /dev/null`
echo;echo -e "${GREEN}>>> Detected distribution: ${DISTRO}${RESETCOLOR}"


### Ubuntu
if [ $DISTRO == "ubuntu" ]; then
	#apt-add-repository ppa:i2p-maintainers/i2p
	sudo apt update
#### Debian(-based) systems
elif [ $DISTRO == "debian" ]; then
  	sudo apt update
### Downstream Debian, like Kali, Parrot etc.
elif [ $DISTRO == "kali" ]; then
	sudo apt update
else
	echo "Unsupported Linux distro: $DISTRO. Exiting..."
	exit 1
fi

echo;echo -e "${GREEN}>>> Installing packages${RESETCOLOR}"
sudo apt install python3 gir1.2-gtk-4.0 secure-delete tor curl bleachbit iptables iptables-persistent -y

echo;echo "All done."
exit 0