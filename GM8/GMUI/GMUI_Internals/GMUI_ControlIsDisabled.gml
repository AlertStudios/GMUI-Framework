#define GMUI_ControlIsDisabled
/// Is control of name disabled
// argument0 is the string of the key (control)

with (GMUII()) {
    // Retrieve control from the reference map
    var control;
    control = ds_map_find_value(GMUI_map,string(argument0));
    if (string(control) == "0") {
        GMUI_ThrowError("Control doesn't exist in GMUI_ControlIsDisabled()");
        return false;
    }
    else {
        return (control).Disabled;
    }
}

