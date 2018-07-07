#define GMUI_ControlSetDefaultStyle
///GMUI_ControlSetDefaultStyle(id, SetBlank[bool])
/// Get the default style values from the grid controller

if (!instance_exists(argument0))
{
    GMUI_ThrowErrorDetailed("Invalid control", GMUI_ControlSetDefaultStyle);
    return false;
}

with (argument0)
{
    if (argument1) {
        ControlBackgroundColor = -1;
        ControlBorderColor = -1;
        ControlHoverColor = -1;
        ControlHoverBorder = false;
        ControlHoverAlpha = 1;
        ControlOverwriteColor = -1;
        ControlOverwriteAlpha = 1;
        ControlSelectColor = -1;
        ControlSelectAlpha = 1;
        ControlShowCursor = false;
        GMUI_ControlSetStyle(-1,-1,-1,-1,-1,-1,-1,-1,-1,-1);
    }
    else {
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
}

return true;

