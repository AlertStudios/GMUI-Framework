/// Is control of name hidden
// argument0 is the string of the key (control)

with (GMUII()) {
    // Retrieve control from the reference map
    var control;
    control = ds_map_find_value(GMUI_map,string(argument0));
    if (string(control) == "0") {
        GMUI_ThrowError("Control doesn't exist in GMUI_ControlIsHidden()");
        return false;
    }
    else {
        return (control).Hidden;
    }
}
