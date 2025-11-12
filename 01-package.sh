#!/usr/bin/env bash

set -e

BLUE='\033[1;94m'
GREEN='\033[1;92m'
RED='\033[1;91m'
RESETCOLOR='\033[1;00m'
TARGET=./dist/anonsurf.deb


# Remove old build, if exists
echo -e "${GREEN}>>> Deleting old build${RESETCOLOR}"
if [[ -f $TARGET ]] ; then
	rm $TARGET
fi


# Build the .deb package
echo -e "${GREEN}>>> Building package ${TARGET}${RESETCOLOR}"
dpkg-deb --root-owner-group -b anonsurf-deb-src/ ${TARGET}

echo
echo "All done. You may now install ${TARGET}"
echo

exit 0 
