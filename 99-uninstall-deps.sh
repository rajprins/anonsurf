#!/usr/bin/env bash
#
#
# Dependencies: tor secure-delete curl bleachbit iptables iptables-persistent

BLUE='\033[1;94m'
GREEN='\033[1;92m'
RED='\033[1;91m'
RESETCOLOR='\033[1;00m'

if [ $(id -u) -ne 0 ]; then
	echo;echo -e "${RED}Sorry, you must be root to run this script. Exiting...${RESETCOLOR}";echo
	exit 1
fi

echo;echo -e "${GREEN}>>> Deleting Anonsurf dependencies${RESETCOLOR}"
apt purge --autoremove tor secure-delete curl bleachbit iptables iptables-persistent zenity -y

echo;echo "All done."
exit 0
