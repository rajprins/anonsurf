# Anonsurf

ParrotSec's anonsurf and stealth, ported to work with Debian/Ubuntu systems. Now with a simple GUI wrapper for your convenience. 

Modifications have been made to use the DNS servers of Private Internet Access (instead of FrozenDNS), and fixes for users who don't use the resolvconf application. 

NOTE: This will likely work with most Debian/Ubuntu systems, but this has only been testing on Kali Linux.

## How to use this repo

This repo contains the sources of Anonsurf, which can be compiled into a .deb package. Once compiled, you can install the deb package using a package manager or the ```dpkg``` or ```apt``` commands.

The easiest way to get this working is to just run the installer. See the installation section for further info.


## Usage
### Pandora
Pandora automatically overwrites the RAM when the system is shutting down. Pandora can also be ran manually:
```bash
pandora bomb
```

NOTE: This will clear the entire system cache, including active SSH tunnels or sessions.

### Anonsurf (GUI)
After installing, Anonsurf-gui can be started from a terminal, using the following command : 
```
/usr/bin/anonsurf-gui
```
Alternatively, you can launch anonsurf-gui from a launcher. The main desktop environments (KDE, Gnome, XFCE etc) will have a launcher icon in the menu structure.



### Anonsurf (CLI)
Anonsurf will anonymize the entire system under TOR using IPTables. It will also allow you to start and stop i2p as well.

NOTE: DO NOT run this as ```service anonsurf $COMMAND```. Run this as ```anonsurf $COMMAND```

```bash
Usage:
 anonsurf {start|stop|restart|change|status}

 start - Start system-wide anonymous tunneling under TOR proxy through iptables
 stop - Reset original iptables settings and return to clear navigation
 restart - Combines "stop" and "start" options
 change - Changes identity restarting TOR 
 status - Check if AnonSurf is working properly
 ip - Show current IP address details
----[ I2P related features ]----
 starti2p - Start i2p services
 stopi2p - Stop i2p services
```

## Prerequisites  
Anonsurf has a number of depdencies, which will mostly be resolved by your package manager.
However, Anonsurf also depends on I2P (the Invisible Internet Project, an anonymous network layer). You may have to add the I2P repos to your system, which can be done manually, or by running the supplied install script.

Manual installation steps for I2P:

1) Open a terminal and enter:  
```bash
sudo apt-add-repository ppa:i2p-maintainers/i2p
```  
This command will add the PPA to /etc/apt/sources.list.d and fetch the gpg key that the repository has been signed with. The GPG key ensures that the packages have not been tampered with since being built.

2) Notify your package manager of the new PPA by entering:  
```bash
sudo apt-get update
```  
This command will retrieve the latest list of software from each repository that is enabled on your system, including the I2P PPA that was added with the earlier command.

3) You are now ready to install Anonsurf and I2P!  
```bash
sudo apt-get install i2p
```


## Installation
Anonsurf comes with an installer that care of adding the I2P repos and building the deb file.

```bash
sudo ./installer.sh
```

Once the installer is complete, you will be able to use Anonsurf on both command line and GUI.


