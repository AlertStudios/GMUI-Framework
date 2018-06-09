///GMUI_ControlSetStretchToGrid(Stretch Direction)
///Set the style of the controls that will be used for new controls (to override the defaults)
if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowErrorDetailed("Invalid control", GMUI_ControlSetStretchToGrid);
    return false;
}

// If any values are given as negative numbers, those values will remain as the control default

if (argument0 >= 0)
    ControlStretch = min(2,argument0);

return true;
    
