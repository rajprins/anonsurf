# AnonSurf Python GUI

This is a modern Python-Qt6 GUI application that replaces the original bash script-based GUI for AnonSurf.

## Features

- **Modern Interface**: Clean, responsive Qt6-based user interface
- **Real-time Status**: Live updates of Tor status and IP address
- **Threaded Operations**: All AnonSurf operations run in background threads to keep the UI responsive
- **Progress Indicators**: Visual feedback during operations
- **Logging**: Built-in log area to track operations
- **Error Handling**: Comprehensive error handling with user-friendly messages
- **Sudo Integration**: Secure password handling for privileged operations

## Requirements

- Python 3.7 or higher
- PyQt6
- requests library
- AnonSurf CLI tools (installed via the main installation)

## Installation

1. **Install Python dependencies:**
   ```bash
   ./setup-python-gui.sh
   ```

2. **Or manually install dependencies:**
   ```bash
   pip3 install PyQt6 requests
   ```

3. **Make the script executable:**
   ```bash
   chmod +x anonsurf-deb-src/usr/bin/anonsurf-gui.py
   ```

## Usage

Run the Python GUI:
```bash
python3 anonsurf-deb-src/usr/bin/anonsurf-gui.py
```

Or if you've installed it system-wide:
```bash
anonsurf-gui.py
```

## Interface Overview

### Status Section
- **Tor Status**: Shows whether Tor is currently running
- **IP Address**: Displays your current public IP address

### Actions Section
- **Start Anonymous Browsing**: Starts the AnonSurf service
- **Stop Anonymous Browsing**: Stops the AnonSurf service
- **Change IP Address**: Changes Tor nodes to get a new IP
- **Show IP Details**: Displays detailed information about your current IP

### Log Section
- Shows timestamps and messages for all operations
- Helps with troubleshooting

## Key Improvements Over Bash Script

1. **Better UX**: Modern interface with proper buttons and layouts
2. **Non-blocking**: Operations don't freeze the interface
3. **Real-time Updates**: Status updates automatically every 5 seconds
4. **Better Error Handling**: Clear error messages and recovery options
5. **Progress Feedback**: Visual indicators during operations
6. **Logging**: Built-in log area for debugging
7. **Cross-platform**: Works on any system with Python and Qt6

## Troubleshooting

### Missing Dependencies
If you see dependency errors, ensure:
- AnonSurf CLI is installed: `/etc/init.d/anonsurf` exists
- Tor is installed: `tor` command is available
- curl is installed: `curl` command is available

### Permission Issues
- The application will prompt for sudo password when needed
- Ensure your user has sudo privileges

### Network Issues
- If IP information fails to load, check your internet connection
- The application uses `icanhazip.com` and `ip-api.com` for IP information

## Development

The application is built with:
- **PyQt6**: Modern Qt6 bindings for Python
- **QThread**: For background operations
- **subprocess**: For running AnonSurf commands
- **requests**: For HTTP requests to get IP information

## File Structure

```
anonsurf-deb-src/usr/bin/anonsurf-gui.py  # Main GUI application
requirements.txt                          # Python dependencies
setup-python-gui.sh                       # Setup script
PYTHON_GUI_README.md                      # This file
```

## License

This Python GUI follows the same license as the main AnonSurf project.

