///GMUI_ControlSetScrollbarStyle(Background Color, Alpha, Hover Color, Hover Alpha, Scrollbar Color, Alpha, Hover Color, Hover Alpha)
/// Set the scrollbar styling

if (!GMUI_IsControl() && id != GMUII()) {
    GMUI_ThrowErrorDetailed("Invalid control",GMUI_ControlSetScrollbarStyle);
    return false;
}

// If any values are given as negative numbers, those values will remain as the control default
if (is_real(argument0)) {
    if (argument0 > 0)
        Scrollbar_bgcolor = argument0;
}

if (is_real(argument1)) {
    if (argument1 >= 0)
        Scrollbar_bgalpha = min(argument1,1);
}

if (is_real(argument2)) {
    if (argument2 >= 0)
        Scrollbar_bgcolor_hover = argument2;
}

if (is_real(argument3)) {
    if (argument3 >= 0)
        Scrollbar_bgalpha_hover = min(argument3,1);
}

if (is_real(argument4)) {
    if (argument4 > 0)
        Scrollbar_color = argument4;
}

if (is_real(argument5)) {
    if (argument5 >= 0)
        Scrollbar_alpha = min(argument5,1);
}

if (is_real(argument6)) {
    if (argument6 >= 0)
        Scrollbar_color_hover = argument6;
}

if (is_real(argument7)) {
    if (argument7 >= 0)
        Scrollbar_alpha_hover = min(argument7,1);
}



return true;
    

