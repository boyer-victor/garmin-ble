using Toybox.WatchUi;
using Toybox.BluetoothLowEnergy as Ble;

class BleDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    // Handle menu button press
    function onMenu() {
        return true;
    }

    // Handle back button press
    function onBack() {
        return false;
    }

}
