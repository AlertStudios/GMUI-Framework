/// Hide or show a control
// argument0 is the string of the key (control)
// argument1 is to hide (1) or show (0)

with (GMUII()) {
    // Retrieve control from the reference map
    var control;
    control = ds_map_find_value(GMUI_map,string(argument0));
    if (string(control) == "0")
        return false;
    else {
        (control).Hidden = argument1;
        return true;
    }
}
