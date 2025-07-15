#!/usr/bin/env bash
#
#
# Dependencies: tor i2p i2p-keyring i2p-router curl bleachbit iptables iptables-persistent zenity


BLUE='\033[1;94m'
GREEN='\033[1;92m'
RED='\033[1;91m'
RESETCOLOR='\033[1;00m'
APTSRC="/etc/apt/sources.list.d/i2p.list"
KEYFILE="i2p-archive-keyring.gpg"


if [ $(id -u) -ne 0 ]; then
	echo;echo -e "${RED}Sorry, you must be root to run this script. Exiting...${RESETCOLOR}";echo
	exit 1
fi

DISTRO=`awk -F'=' '/^ID=/ {print tolower($2)}' /etc/*-release 2> /dev/null`
echo;echo -e "${GREEN}>>> Detected distribution: ${DISTRO}${RESETCOLOR}"


#echo;echo -e "${GREEN}>>> Preparing I2P repository${RESETCOLOR}"
#if [[ -f ${APTSRC} ]] ; then
#   rm -f ${APTSRC}
#fi

### Ubuntu
if [ $DISTRO == "ubuntu" ]; then
	#apt-add-repository ppa:i2p-maintainers/i2p
	apt update
#### Debian(-based) systems
elif [ $DISTRO == "debian" ]; then
	#apt-get update
	#apt-get install apt-transport-https lsb-release curl -y
	#curl -o /tmp/${KEYFILE} https://geti2p.net/_static/${KEYFILE}
	#cp /tmp/${KEYFILE} /usr/share/keyrings/
  	#echo "deb [signed-by=/usr/share/keyrings/${KEYFILE}] https://deb.i2p.net/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/i2p.list
  	apt update
### Downstream Debian, like Kali, Parrot etc.
elif [ $DISTRO == "kali" ]; then
	#curl -o /tmp/${KEYFILE} https://geti2p.net/_static/${KEYFILE}
	#cp /tmp/${KEYFILE} /usr/share/keyrings/
  	#echo "deb [signed-by=/usr/share/keyrings/${KEYFILE}] https://deb.i2p.net/ $(dpkg --status tzdata | grep Provides | cut -f2 -d'-') main" | sudo tee /etc/apt/sources.list.d/i2p.list
	apt update
else
	echo "Unsupported Linux distro: $DISTRO. Exiting..."
	exit 1
fi

echo;echo -e "${GREEN}>>> Installing packages${RESETCOLOR}"
#apt install zenity tor i2p i2p-keyring i2p-router curl bleachbit iptables iptables-persistent -y
apt install zenity tor curl bleachbit iptables iptables-persistent -y

echo;echo "All done."
exit 0