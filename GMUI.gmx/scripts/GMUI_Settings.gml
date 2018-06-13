///GMUI_Settings(OptionalInterfaceArgument) Settings for GMUI - Do not delete! Modify to fit your preferences
///Called from the initialization of each GMUI interface. Argument can set specific settings depending on the interface.
// Don't change these values in runtime, only change them here.

// Required: Define the controls' object!
GMUI_controlobject = GMUI_control;

// Required: Snap the grid to the view position in the room
UIsnaptoview = true;
// Required: The view number to snap to
UIgridview = 0;

// Required: Surfaces are needed for listboxes and scrollable menus, but also draws the grid as a surface itself
UIEnableSurfaces = true;

// Required: Flexibility to add graphical effects settings to the controls: (currently unused)
var basic, good, best; basic = 0; good = 1; best = 2;
graphicsSetting = best;

// Initial depth (z-index) default value. Other objects will have depths relative to this
depth = -9999;

// Required: Other specific functionality settings that can be turned off if unwanted
GMUIRemoveExtraDecimalZeros = true;     // Trim extra zeroes in decimal-type controls
GMUIAllowDoubleSelect = true;           // If double selected, the control will overwrite the contents
GMUIEnableTabbing = true;               // Tab key will advance to the next control
GMUIEnableEnterKey = true;              // Enter key will deselect the control

// Required: Show a pop-up of the GMUI error message when it happens (default: false)
PopUpGMUIError = false;

// Required: Clear mouse actions when interacting with GMUI instances (default: false)
CaptureMouseEvents = false;


// Required: Allow setting debug data for testing
DebugData = false;



// Argument can be used optionally for different GMUI instances
var OptionalInterfaceName; OptionalInterfaceName = argument0;
switch (OptionalInterfaceName) {
    case _Test_Form:
        // Do Something
    break;
}



