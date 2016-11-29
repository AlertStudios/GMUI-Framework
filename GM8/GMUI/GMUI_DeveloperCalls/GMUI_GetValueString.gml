#define GMUI_GetValueString
/// Return the value string of a control back to use in user code
// argument0 is the string of the key

with (GMUII()) {
    // Retrieve control from the reference map
    var control;
    control = ds_map_find_value(GMUI_map,string(argument0));
    if (string(control) == "0")
        return 0;
    else
        return (control).valueString;
}

