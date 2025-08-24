#!/bin/bash

# Setup script for AnonSurf Python GUI
# This script installs the required Python dependencies

echo "Setting up AnonSurf Python GUI..."

# Check if Python 3 is installed
if ! command -v python3 &> /dev/null; then
    echo "Error: Python 3 is not installed. Please install Python 3 first."
    exit 1
fi

# Check if pip is installed
if ! command -v pip3 &> /dev/null; then
    echo "Error: pip3 is not installed. Please install pip3 first."
    exit 1
fi

# Install Python dependencies
echo "Installing Python dependencies..."
pip3 install -r requirements.txt

# Make the GUI script executable
echo "Making GUI script executable..."
chmod +x anonsurf-deb-src/usr/bin/anonsurf-gui.py

echo "Setup complete! You can now run the Python GUI with:"
echo "python3 anonsurf-deb-src/usr/bin/anonsurf-gui.py"

