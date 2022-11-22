# Anonsurf

![Screenshot](https://github.com/rajprins/anonsurf/raw/master/images/anonsurf.png)

ParrotSec's anonsurf and stealth, ported to work with Debian/Ubuntu systems. Now with a simple GUI wrapper for your convenience. 

Modifications have been made to use the DNS servers of Private Internet Access (instead of FrozenDNS), and fixes for users who don't use the resolvconf application. 

NOTE: This will work on most Debian/Ubuntu systems, but this has only been tested on Kali Linux.

## How to use this repo

This repo contains the sources of Anonsurf, which can be compiled into a .deb package. Once compiled, you can install the deb package using a package manager or the ```dpkg``` or ```apt``` commands.

The easiest way to get this working is to just run the installer. See the [installation](https://github.com/rajprins/anonsurf#installation) section for further info.


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

Steps for manual installation of I2P on Debian/Ubuntu systems can be found [here](https://geti2p.net/en/download/debian)


## Installation
Anonsurf comes with an installer that takes care of adding the I2P repos, building the deb file and installing it. Please note this must be done with root permissions.

```bash
sudo ./installer.sh
```

Once the installer is complete, you will be able to use Anonsurf on both command line and GUI.

Alternatively, download the latest Anonsurf release and install it using `apt` or `dpkg`.


## Using Anonsurf (GUI)
The easiest way to use Anonsurf is launching the GUI version and selecting an option from the main window.
![Action](https://github.com/rajprins/anonsurf/raw/master/images/Main.png)  

To start anonymous browsing, select action "start" and click the OK button.
![start](https://github.com/rajprins/anonsurf/raw/master/images/Actions.png)

When starting an action like starting or stopping the anonymous service, a progress bar will be displayed. Click the OK button after completion to close the dialog.  
![progress](https://github.com/rajprins/anonsurf/raw/master/images/Stopping.png)

At any time, you can verify your IP address (and geo location details for that IP address) using the "status" option.
![status](https://github.com/rajprins/anonsurf/raw/master/images/Status.png)

## Using Anonsurf (command line)
Anonsurf comes with a terminal version and a GUI version.  
To launch Anonsurf from command line, using the following command: `sudo anonsurf <ACTION>`  
*Note: anonsurf must be run as root, or using 'sudo'*  

The available actions are the same as in the GUI version.  
To get an overview of available actions, simply run `anonsurf`  
![anonsurf-cli](https://github.com/rajprins/anonsurf/raw/master/images/anonsurf-cli.png)