#define GMUI_GroupSetStyle
///GMUI_GroupSetStyle(Background Color, Background Alpha, Border color, Border Alpha, Is RoundRect)
///Set the style of the controls that will be used for new controls (to override the defaults)
if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowError("Invalid control for GMUI_ControlSetStyle");
    return false;
}

// If any values are given as negative numbers, those values will remain as the control default [Not set in Demo]

if (argument0 >= 0)
GroupBackgroundColor = argument0;
if (argument1 >= 0)
GroupBackgroundAlpha = minmax(argument1,0,1);
if (argument2 >= 0)
GroupBorderColor = argument2;
if (argument3 >= 0)
GroupBorderAlpha = minmax(argument3,0,1);
if (argument4 >= 0)
GroupIsRoundRect = minmax(argument4,0,1);


ControlHasGroupStyle = true;

return true;
    

