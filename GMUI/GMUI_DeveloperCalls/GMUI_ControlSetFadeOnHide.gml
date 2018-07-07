///GMUI_ControlSetFadeOnHide("ControlName" or id, speed in steps)
///Set the fade in/out when the control is hidden or not

with (GMUII()) {
    // Retrieve control from the reference map
    var _ctrl;
    if (is_string(argument0))
        _ctrl = ds_map_find_value(GMUI_map,argument0);
    else
        _ctrl = argument0;
    
    if (string(_ctrl) == "0")
        return false;
    else {
        // Set the fade settings for when hiding or unhiding
        (_ctrl).FadeTime = argument1;
        (_ctrl).FadeOnHide = true;
        if ((_ctrl).Hidden)
            (_ctrl).FadeAlpha = 0;
        return true;
    }
}

