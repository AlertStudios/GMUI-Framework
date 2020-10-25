///GMUI_ControlStretchToGrid(true/false)
///Set the control to stretch across the grid on the opposite anchor axis, offset by the X/Y cell
function GMUI_ControlStretchToGrid(argument0) {
if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowErrorDetailed("Invalid control", GMUI_ControlStretchToGrid);
    return false;
}

// Set the stretch flag
StretchToGrid = false;
if (is_string(argument0)) {
    if (string_lower(argument0) == "true")
        StretchToGrid = true;
}
else {
    if (argument0)
        StretchToGrid = true;
}
    


// Reset control position
GMUI_ControlPosition(id,RelativeCellX,RelativeCellY,RelativeX,RelativeY,Anchor);
    

return true;
}


