///GMUI_ControlSetAttributes(max string length(or 0 for none), max decimal length if applicable, min value, max value, )
///Set the attributes of the control for the different types (to override the defaults)

if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowError("Invalid control for GMUI_ControlSetAttributes");
    return false;
}


    ControlMaxStringLength = argument0;
    ControlMaxDecimalLength = argument1; // If applicable
    ControlMinValue = argument2;
    ControlMaxValue = argument3;

return true;
    
