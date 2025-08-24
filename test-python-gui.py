#!/usr/bin/env python3

"""
Test script for AnonSurf Python GUI
This script tests basic functionality without running the full GUI
"""

import sys
import os

def test_imports():
    """Test if all required modules can be imported"""
    print("Testing imports...")
    
    try:
        import PyQt6
        print("✓ PyQt6 imported successfully")
    except ImportError as e:
        print(f"✗ Failed to import PyQt6: {e}")
        return False
    
    try:
        import requests
        print("✓ requests imported successfully")
    except ImportError as e:
        print(f"✗ Failed to import requests: {e}")
        return False
    
    try:
        import xml.etree.ElementTree
        print("✓ xml.etree.ElementTree imported successfully")
    except ImportError as e:
        print(f"✗ Failed to import xml.etree.ElementTree: {e}")
        return False
    
    return True

def test_dependencies():
    """Test if system dependencies are available"""
    print("\nTesting system dependencies...")
    
    import subprocess
    
    dependencies = {
        'anonsurf': '/etc/init.d/anonsurf',
        'tor': 'tor',
        'curl': 'curl',
        'systemctl': 'systemctl'
    }
    
    all_good = True
    for name, path in dependencies.items():
        if name == 'anonsurf':
            if os.path.exists(path):
                print(f"✓ {name} found at {path}")
            else:
                print(f"✗ {name} not found at {path}")
                all_good = False
        else:
            try:
                subprocess.run(['which', path], check=True, capture_output=True)
                print(f"✓ {name} found in PATH")
            except subprocess.CalledProcessError:
                print(f"✗ {name} not found in PATH")
                all_good = False
    
    return all_good

def test_network():
    """Test network connectivity for IP services"""
    print("\nTesting network connectivity...")
    
    try:
        import requests
        response = requests.get('https://icanhazip.com', timeout=5)
        if response.status_code == 200:
            print(f"✓ IP service (icanhazip.com) accessible: {response.text.strip()}")
        else:
            print(f"✗ IP service returned status {response.status_code}")
            return False
    except Exception as e:
        print(f"✗ Failed to access IP service: {e}")
        return False
    
    return True

def main():
    print("AnonSurf Python GUI Test")
    print("=" * 30)
    
    # Test imports
    if not test_imports():
        print("\n❌ Import test failed. Please install required Python packages:")
        print("pip3 install PyQt6 requests")
        sys.exit(1)
    
    # Test dependencies
    if not test_dependencies():
        print("\n❌ Dependency test failed. Please install required system packages.")
        sys.exit(1)
    
    # Test network
    if not test_network():
        print("\n⚠️  Network test failed. Some features may not work without internet.")
    
    print("\n✅ All tests passed! The Python GUI should work correctly.")
    print("\nTo run the GUI:")
    print("python3 anonsurf-deb-src/usr/bin/anonsurf-gui.py")

if __name__ == '__main__':
    main()

