///GMUI_ControlSelectOption("ControlName", key value)
///Safely set the value of a selection control using key value

with (GMUII())
{
    // Retrieve control from the reference map
    var _SCRIPT,_ctrl;
    _SCRIPT = GMUI_ControlSelectOption;
    _ctrl = ds_map_find_value(GMUI_map,argument0);
    
    if (string(_ctrl) == "0") {
        GMUI_ThrowErrorDetailed("Control not found: " + argument0,_SCRIPT);
    }
    else if ((_ctrl).optionsInitialized) {
        if (ds_map_exists((_ctrl).OptionsMap,argument1)) {
            (_ctrl).value = argument1;
            (_ctrl).valueString = string((_ctrl).value);
    
            // If script is assigned to value change, execute it
            if (GMUI_IsScript((_ctrl).ValueChangedActionScript)) {
                script_execute((_ctrl).ValueChangedActionScript);
            }
        }
        else
        {
            GMUI_ThrowErrorDetailed("Key value not defined",_SCRIPT);
        }
    }
    else {
        GMUI_ThrowErrorDetailed("Not yet initialized. No options for '" + argument0 + "'?",_SCRIPT);
    }
    
}

