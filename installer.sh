#!/bin/bash


### Ensure we are being ran as root
if [ $(id -u) -ne 0 ]; then
	echo "Sorry, this script must be ran as root"
	exit 1
fi


### For upgrades and sanity check, remove any existing i2p.list file
rm -f /etc/apt/sources.list.d/i2p.list


### Compile the i2p ppa
echo "deb https://deb.i2p2.de/ unstable main" > /etc/apt/sources.list.d/i2p.list # Default config reads repos from sources.list.d
wget https://geti2p.net/_static/i2p-debian-repo.key.asc --no-check-certificate  -O /tmp/i2p-debian-repo.key.asc # Get the latest i2p repo pubkey
apt-key add /tmp/i2p-debian-repo.key.asc # Import the key
rm /tmp/i2p-debian-repo.key.asc # delete the temp key
apt-get update # Update repos


#### This will ensure you get updates to the repository's GPG key and other dependencies, just in case
apt install -y secure-delete tor i2p geoip-bin i2p-keyring i2p-router libjbigi-jni wget curl
apt-get -f install # resolves anything else in a broken state
apt install -y python3-pip
pip install xq


### Build and install the .deb package
dpkg-deb -b anonsurf-deb-src/ anonsurf.deb
dpkg -i anonsurf.deb || (apt-get -f install && dpkg -i anonsurf.deb) 


### Bye
echo "All done."
exit 0
