///GMUI_ControlSetDefaultButton(id)
/// Set the default attributes of the control from the controller
function GMUI_ControlSetDefaultButton(argument0) {

if (!instance_exists(argument0))
{
    GMUI_ThrowError("Invalid control for GMUI_ControlSetDefaultButton");
    return false;
}

with (argument0)
{
    GMUI_ControlSetButton(
    (GMUII()).ControlButtonText,
    (GMUII()).ControlButtonIcon,
    (GMUII()).ControlFontAlign,
    (GMUII()).ControlButtonTextHoverColor
    );
}


return true;
}

