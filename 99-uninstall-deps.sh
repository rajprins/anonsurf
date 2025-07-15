#!/usr/bin/env bash
#
#
# Dependencies: tor i2p i2p-keyring i2p-router curl bleachbit iptables iptables-persistent


BLUE='\033[1;94m'
GREEN='\033[1;92m'
RED='\033[1;91m'
RESETCOLOR='\033[1;00m'

APTSRC="/etc/apt/sources.list.d/i2p.list"
KEYFILE="/usr/share/keyrings/i2p-archive-keyring.gpg"

if [ $(id -u) -ne 0 ]; then
	echo;echo -e "${RED}Sorry, you must be root to run this script. Exiting...${RESETCOLOR}";echo
	exit 1
fi


echo;echo -e "${GREEN}>>> Deleting Anonsurf dependencies${RESETCOLOR}"
apt purge --autoremove tor i2p* curl bleachbit iptables iptables-persistent zenity -y

echo;echo -e "${GREEN}>>> Clearing Apt sources${RESETCOLOR}"
if [ -f $APTSRC ] ; then
	rm -f $APTSRC
fi

if [ -f $KEYFILE ] ; then
	rm -f $KEYFILE
fi

echo;echo "All done."
exit 0
