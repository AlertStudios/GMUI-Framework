#define GMUI_ControlSetFontStyle
///GMUI_ControlSetStyle(Background Color, Border color, Hover color, hover border/rect, border alpha, font, font color, font align)
///Set the style of the controls that will be used for new controls (to override the defaults)
if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowError("Invalid control for GMUI_ControlSetStyle");
    return false;
}

ControlFont = argument0;
ControlFontColor = argument1;
ControlFontAlign = argument2;
    
// Defaults that can be optional in the future
ControlFontAlpha = 1;
    
return true;
    

