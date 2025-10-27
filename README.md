# garmin-ble

A basic Garmin Connect IQ application demonstrating BLE (Bluetooth Low Energy) functionality using Monkey C.

## Overview

This application follows the official Garmin Connect IQ BLE tutorial structure and demonstrates:
- BLE scanning capabilities
- Basic app structure with View and Delegate pattern
- Resource management with strings and drawables
- Proper manifest configuration for BLE permissions

## Project Structure

```
garmin-ble/
├── manifest.xml              # App manifest with BLE permissions
├── monkey.jungle             # Build configuration
├── source/                   # Monkey C source files
│   ├── BleApp.mc            # Main application class
│   ├── BleView.mc           # UI View class with BLE scanning
│   └── BleDelegate.mc       # Input delegate handler
└── resources/               # Application resources
    ├── resources.xml        # Resource definitions
    ├── drawables/          # Icons and images
    │   └── launcher_icon.png
    └── strings/            # Localized strings
```

## Features

- **BLE Scanning**: Automatically starts BLE scanning when the app is shown
- **Status Display**: Shows current BLE status on screen
- **Proper Lifecycle**: Handles app start, stop, show, and hide events
- **Resource Management**: Uses proper resource IDs for strings and drawables

## Requirements

- Garmin Connect IQ SDK 3.1.0 or later
- Compatible Garmin device with BLE support:
  - Fenix 5 Plus or later
  - Fenix 6 series
  - Forerunner 945
  - Venu
  - Vivoactive 4

## Building

To build this application, you need the Garmin Connect IQ SDK installed.

```bash
# Using the SDK compiler
monkeyc -o output.prg -f monkey.jungle -y /path/to/developer_key
```

## Development

This app follows the standard Connect IQ application pattern:
1. `BleApp` extends `Application.AppBase` - main entry point
2. `BleView` extends `WatchUi.View` - handles UI rendering and BLE operations
3. `BleDelegate` extends `WatchUi.BehaviorDelegate` - handles user input

## BLE Permissions

The app requests the `BluetoothLowEnergy` permission in the manifest, which is required for:
- Scanning for BLE devices
- Connecting to BLE peripherals
- Reading/writing BLE characteristics

## License

This is a tutorial/example application for educational purposes.