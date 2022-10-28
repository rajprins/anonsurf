#!/usr/bin/env bash


BLUE='\033[1;94m'
GREEN='\033[1;92m'
RED='\033[1;91m'
RESETCOLOR='\033[1;00m'


# Build the .deb package
echo -e "${GREEN}>>> Building package anonsurf.deb${RESETCOLOR}"
dpkg-deb -b anonsurf-deb-src/ anonsurf.deb

echo
echo "All done. You may now install anonsurf.deb"
echo

exit 0 
