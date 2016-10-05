/// Set the style of the controls that will be used for new controls (to override the defaults)
//GMUI_ControlSetStyle(Background Color, Border color, Hover color, hover border/rect, border alpha, Select color, Select alpha, show cursor)
if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowError("Invalid control for GMUI_ControlSetStyle");
    return false;
}

// If any values are given as negative numbers, those values will remain as the control default

if (argument0 >= 0)
ControlBackgroundColor = argument0;
if (argument1 >= 0)
ControlBorderColor = argument1;
if (argument2 >= 0)
ControlHoverColor = argument2;
if (argument3 >= 0)
ControlHoverBorder = argument3; // Draw a second border on hover (1), or rectangle over control (0)
if (argument4 >= 0)
ControlHoverAlpha = minmax(argument4,0,1);
if (argument5 >= 0)
ControlOverwriteColor = argument5;
if (argument6 >= 0)
ControlOverwriteAlpha = argument6;
if (argument7 >= 0)
ControlSelectColor = argument7;
if (argument8 >= 0)
ControlSelectAlpha = argument8;
if (argument9 >= 0)
ControlShowCursor = argument9;

    
// Defaults that can be optional in the future
ControlBackgroundAlpha = 1;

return true;
    
