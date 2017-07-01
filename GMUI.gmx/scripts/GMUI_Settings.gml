///GMUI_Settings("OptionalInterfaceArgument") Settings for GMUI - Do not delete! Modify to fit your preferences
///Called from the initialization of each GMUI interface. Argument can set specific settings depending on the interface.


// Required: Define the controls' object!
GMUI_controlobject = GMUI_control;

// Required: Flexibility to add graphical effects settings to the controls:
var basic, good, best; basic = 0; good = 1; best = 2;
graphicsSetting = best;

// Required: Other specific functionality settings that can be turned off if unwanted
GMUIRemoveExtraDecimalZeros = true;     // Trim extra zeroes in decimal-type controls
GMUIAllowDoubleSelect = true;           // If double selected, the control will overwrite the contents
GMUIEnableTabbing = true;               // Tab key will advance to the next control
GMUIEnableEnterKey = true;              // Enter key will deselect the control

// Required: Enable setting debug data for testing
DebugData = false;

// Required: Show a pop-up of the GMUI error message when it happens
PopUpGMUIError = false;



// Initial depth (z-index) value. Other objects will have depths relative to this
depth = -9999;



// Argument can be used optionally for different GMUI instances
var OptionalInterfaceName; OptionalInterfaceName = argument0;
if (script_exists(OptionalInterfaceName)) {
    // Do Something
}



