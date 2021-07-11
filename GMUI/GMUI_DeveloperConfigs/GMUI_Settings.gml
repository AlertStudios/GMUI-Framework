///GMUI_Settings() Settings for GMUI - Do not delete! Modify to fit your preferences
///Called from the initialization of each GMUI interface.
function GMUI_Settings() {

// DO NOT MODIFY VALUES HERE! CALL GMUI CONFIG SCRIPTS BEFORE OR IN CONTROL DEFAULTS //


// Required: Flexibility to add graphical effects settings to the controls:
// (currently unused)
var basic, good, best; basic = 0; good = 1; best = 2;
graphicsSetting = best;

// Ghosting redraw: Number of extra redraw steps to avoid ghosting with surfaces
GMUIRedrawSteps = 1;

// Navigation Options
GMUIEnableMouseNav = true;
GMUIEnableControllerNav = true;
GMUIEnableAutoControllerSwitch = false;

// Tab key will advance to the next control
GMUIEnableTabbing = true;

// Default input trim of extra zeros in decimal-type controls
GMUIRemoveExtraDecimalZeros = true;

// Show a pop-up of the GMUI error message when it happens (default: false)
PopUpGMUIError = false;

// Clear mouse actions when interacting with GMUI instances (default: false)
CaptureMouseEvents = false;

// Allow setting debug data for testing
DebugData = false;

}


