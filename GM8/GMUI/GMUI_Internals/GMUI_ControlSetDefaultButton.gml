#define GMUI_ControlSetDefaultButton
/// Set the default attributes of the control from the controller
//GMUI_ControlSetDefaultButton(id)

if (!instance_exists(argument0))
{
    GMUI_ThrowError("Invalid control for GMUI_ControlSetDefaultButton");
    return false;
}

with (argument0)
{
    GMUI_ControlSetButton(
    (GMUII()).ControlButtonText,
    (GMUII()).ControlButtonGraphic,
    (GMUII()).ControlButtonReplaceImage,
    (GMUII()).ControlFontAlign,
    (GMUII()).ControlButtonTextHoverColor
    );
}


return true;

