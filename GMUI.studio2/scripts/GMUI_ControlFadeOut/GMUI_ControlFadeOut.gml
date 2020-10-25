///GMUI_ControlFadeOut("ControlName", speed in steps)
///Fade out a control
function GMUI_ControlFadeOut(argument0,argument1) {

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
        // Call fade down
        (_ctrl).FadeCalled = -1;
        (_ctrl).FadeTime = argument1;
        return true;
    }
}
}

