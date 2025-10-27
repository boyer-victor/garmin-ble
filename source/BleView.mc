using Toybox.WatchUi;
using Toybox.Graphics;
using Toybox.System;
using Toybox.BluetoothLowEnergy as Ble;

class BleView extends WatchUi.View {

    private var _bleStatus;

    function initialize() {
        View.initialize();
        _bleStatus = "Ready to scan";
    }

    // Load your resources here
    function onLayout(dc) {
        setLayout(Rez.Layouts.MainLayout(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
        // Start BLE scanning when view is shown
        if (Ble has :setScanState) {
            try {
                Ble.setScanState(Ble.SCAN_STATE_SCANNING);
                _bleStatus = "Scanning...";
            } catch (ex) {
                _bleStatus = "BLE not available";
            }
        } else {
            _bleStatus = "BLE not supported";
        }
    }

    // Update the view
    function onUpdate(dc) {
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
        
        // Draw BLE status text
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.clear();
        dc.drawText(
            dc.getWidth() / 2,
            dc.getHeight() / 2,
            Graphics.FONT_MEDIUM,
            _bleStatus,
            Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER
        );
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
        // Stop BLE scanning when view is hidden
        if (Ble has :setScanState) {
            try {
                Ble.setScanState(Ble.SCAN_STATE_OFF);
            } catch (ex) {
                // Ignore errors on stop
            }
        }
    }

    function setBleStatus(status) {
        _bleStatus = status;
        WatchUi.requestUpdate();
    }
}
