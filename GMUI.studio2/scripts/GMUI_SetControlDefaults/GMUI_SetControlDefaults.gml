///GMUI_SetControlDefaults() Sets default values for all controls in GMUI instance if not specified in the interface
function GMUI_SetControlDefaults(argument0) {

if (script_exists(argument0))
    global.GMUIDefaults = argument0;
else
    GMUI_ThrowErrorDetailed("Defaults script doesn't exist", GMUI_SetControlDefaults);
    
}

