/// Get the default style values from the grid controller
//GMUI_ControlSetDefaultStyle(id)

if (!instance_exists(argument0))
{
    GMUI_ThrowError("Invalid control for GMUI_ControlSetDefaultStyle");
    return false;
}

with (argument0)
{
    GMUI_ControlSetStyle(
    (GMUII()).ControlBackgroundColor,
    (GMUII()).ControlBorderColor,
    (GMUII()).ControlHoverColor,
    (GMUII()).ControlHoverBorder,
    (GMUII()).ControlHoverAlpha,
    (GMUII()).ControlOverwriteColor,
    (GMUII()).ControlOverwriteAlpha,
    (GMUII()).ControlSelectColor,
    (GMUII()).ControlSelectAlpha,
    (GMUII()).ControlShowCursor
    );
}

return true;
