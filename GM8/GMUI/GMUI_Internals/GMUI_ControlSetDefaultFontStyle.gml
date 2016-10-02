#define GMUI_ControlSetDefaultFontStyle
/// Get the default style values from the grid controller
//GMUI_ControlSetDefaultStyle(id)

if (!instance_exists(argument0))
{
    GMUI_ThrowError("Invalid control for GMUI_ControlSetDefaultFontStyle");
    return false;
}

with (argument0)
{
    GMUI_ControlSetFontStyle(
    (GMUII()).ControlFont,
    (GMUII()).ControlFontColor,
    (GMUII()).ControlFontAlign
    );
}

return true;

