///GMUI_ControlSetDefaultDropdown(id)
/// Set the default attributes of the control from the controller

if (!instance_exists(argument0))
{
    GMUI_ThrowError("Invalid control for GMUI_ControlSetDefaultDropdown");
    return false;
}

with (argument0)
{
    // Default values before applying parent's values
    ControlDropdownParent = -1;
    ControlDropdownCellHigh = 0;
    ControlDropdownCellHighMin = 4;
    
    GMUI_ControlSetPicker(
    (GMUII()).ControlPickerWidth,
    (GMUII()).ControlPickerHeight,
    (GMUII()).ControlPickerDirection,
    (GMUII()).ControlPickerSpriteRightOrUp,
    (GMUII()).ControlPickerSpriteLeftOrDown
    );
}


return true;

