#define GMUI_ControlFadeIn
///GMUI_ControlFadeIn("ControlName", speed in steps)
///Fade in a control to alpha value

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
        // Call fade up
        (_ctrl).FadeCalled = 1;
        (_ctrl).FadeTime = argument1;
        return true;
    }
}

