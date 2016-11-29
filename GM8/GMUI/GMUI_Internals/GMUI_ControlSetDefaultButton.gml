#define GMUI_ControlSetDefaultButton
///GMUI_ControlSetDefaultButton(id)
/// Set the default attributes of the control from the controller

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

