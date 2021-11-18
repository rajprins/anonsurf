#!/bin/bash

# Ensure we are being ran as root
if [ $(id -u) -ne 0 ]; then
	echo "Sorry, this script must be ran as root"
	exit 1
fi

# For upgrades and sanity check, remove any existing i2p.list file
rm -f /etc/apt/sources.list.d/i2p.list



#### Compile the i2p ppa
# Default config reads repos from sources.list.d
echo "deb http://deb.i2p2.no/ unstable main" > /etc/apt/sources.list.d/i2p.list
# Get the latest i2p repo pubkey
wget https://geti2p.net/_static/i2p-debian-repo.key.asc -O /tmp/i2p-debian-repo.key.asc
# Import the key
apt-key add /tmp/i2p-debian-repo.key.asc
# delete the temp key
rm /tmp/i2p-debian-repo.key.asc
# Update repos
apt-get update 


#### This will ensure you get updates to the repository's GPG key and other dependencies, just in case
apt-get install -y secure-delete tor i2p geoip-bin i2p-keyring i2p i2p-router libjbigi-jni


### Configure and install the .deb
# Build the deb package
dpkg-deb -b kali-anonsurf-deb-src/ kali-anonsurf.deb
# Install the packages
dpkg -i kali-anonsurf.deb || (apt-get -f install && dpkg -i kali-anonsurf.deb) 

exit 0
