# Anonsurf

![Screenshot](https://github.com/rajprins/anonsurf/raw/master/images/anonsurf.png)


Anonymous browsing service using Tor. Loosely based on ParrotSec's anonsurf and stealth, ported to work with Debian/Ubuntu systems. 
Now with a simple GTK UI for your convenience. 

Modifications have been made to use the DNS servers of Private Internet Access (instead of FrozenDNS), and fixes for users who don't use the resolvconf application. 

NOTE: This should work on most Debian/Ubuntu systems, including Kali Linux. It will not work on non-Debian systems.

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
Alternatively, you can launch anonsurf-gui from a launcher. The main desktop environments (KDE, Gnome, XFCE etc) should have a launcher icon in the menu structure.



### Anonsurf (CLI)
Anonsurf will anonymize the entire system under TOR using IPTables.

NOTE: DO NOT run this as ```service anonsurf $COMMAND```. Run this as ```anonsurf $COMMAND```

```bash
-----------------------------------------
AnonSurf - The anonymous browsing service
-----------------------------------------

Usage:
   anonsurf {start|stop|restart|change|status|ip}

   start - Start system-wide anonymous tunneling under TOR proxy through iptables
   stop - Reset original iptables settings and return to clear navigation
   restart - Combines "stop" and "start" options
   change - Changes identity restarting TOR
   status - Check if AnonSurf is working properly
   ip - Show your current IP address
```

## Installation
Anonsurf comes with installer scripts that takes care of adding dependencies, building the deb file and installing it. Please note this must all be done with root permissions.


### Prerequisites  
Anonsurf has a number of depdencies, which will mostly (but not all!) be resolved by your package manager.
Therefe, it is highly recommended to install dependencies BEFORE installing Anonsurf itself. Use the following script to install the dependencies:

```bash
sudo ./00-install-deps.sh
```


### AnonSurf Installation
Important: make sure you have installed all dependencies BEFORE installing AnonSurf.

First, create a new package:
```bash
./01-build.sh
```

This will create a new file called `anonsurf.deb`.
Next, you can install Anonsurf using the provided install script:
```bash
sudo ./02-install.sh
```

Alternatively, download the latest Anonsurf release and install it using `apt` or `dpkg`.  


Once the installer is complete, you will be able to use Anonsurf on both command line and GUI.  


## Using Anonsurf (GUI)
The easiest way to use Anonsurf is launching the GUI version and selecting an option from the main window.
![Action](https://github.com/rajprins/anonsurf/raw/master/images/001.png)  

To start anonymous browsing, select action "start" and click the OK button.
![start](https://github.com/rajprins/anonsurf/raw/master/images/002.png)

When starting an action like starting or stopping the anonymous service, a progress bar will be displayed. Click the OK button after completion to close the dialog.  
![progress](https://github.com/rajprins/anonsurf/raw/master/images/003.png)

At any time, you can verify your IP address (and geo location details for that IP address) using the "status" option.
![status](https://github.com/rajprins/anonsurf/raw/master/images/004.png)

## Using Anonsurf (command line)
Anonsurf comes with a terminal version and a GUI version.  
To launch Anonsurf from command line, using the following command: `sudo anonsurf <ACTION>`  
*Note: Anonsurf must be run as root, or using 'sudo'*  

The available actions are the same as in the GUI version.  
To get an overview of available actions, simply run `anonsurf`  
![anonsurf-cli](https://github.com/rajprins/anonsurf/raw/master/images/anonsurf-cli.png)

To start the Anonsurf services, type `sudo anonsurf start`. This will start the browsing service and redirect all traffic to anonymize it.  
![anonsurf-start](https://github.com/rajprins/anonsurf/raw/master/images/anonsurf-start.png)

After starting the anonymous mode, you can check your new IP address and geolocation details by running `sudo anonsurf ip` from command line.  
![anonsurf-ip](https://github.com/rajprins/anonsurf/raw/master/images/anonsurf-ip.png)  
