///GMUI_Settings() Settings for GMUI - Do not delete! Modify to fit your preferences
///Called from the initialization of each GMUI interface.

// Required: Flexibility to add graphical effects settings to the controls:
// (currently unused)
var basic, good, best; basic = 0; good = 1; best = 2;
graphicsSetting = best;

// Required: Other specific functionality settings that can be turned off if unwanted
GMUIRemoveExtraDecimalZeros = true;     // Trim extra zeroes in decimal-type controls
GMUIEnableTabbing = true;               // Tab key will advance to the next control             

// Required: Show a pop-up of the GMUI error message when it happens (default: false)
PopUpGMUIError = false;

// Required: Clear mouse actions when interacting with GMUI instances (default: false)
CaptureMouseEvents = false;


// Required: Allow setting debug data for testing
DebugData = false;



