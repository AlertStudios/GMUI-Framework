#define GMUI_ControlDrawTooltip
///GMUI_ControlDrawTooltip("name of control with the tooltip")
/// Draw the control's tooltip

with (GMUII()) {
    // Retrieve control from the reference map
    var control;
    control = ds_map_find_value(GMUI_map,string(argument0));
    if (string(control) == "0") {
        GMUI_ThrowErrorDetailed("Control doesn't exist", GMUI_ControlDrawTooltip);
        return false;
    }
    else {
        GMUI_ControlDrawTooltipById((control).TooltipId);
    }
}

