///GMUI_ControlSetFontStyle(font, font color, font align)
///Set the style of the controls that will be used for new controls (to override the defaults)
function argument0, argument1, argument2) {
if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowErrorDetailed("Invalid control", GMUI_ControlSetFontStyle);
    return false;
}

if (argument0 > -1 || argument0 == noone)
    ControlFont = argument0;
if (argument1 > -1)
    ControlFontColor = argument1;
if (argument2 > -1)
    ControlFontAlign = argument2;
    
// Defaults that can be optional in the future
ControlFontAlpha = 1;
    
return true;
}

