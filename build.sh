#!/bin/bash

# Build the deb package
echo ">>> Building package anonsurf.deb"
dpkg-deb -b anonsurf-deb-src/ anonsurf.deb 