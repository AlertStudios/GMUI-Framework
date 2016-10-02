#define GMUI_ControlSetInitValue
/// Set the 'default' value (value/string) for the control, but not the actual value

// GMUI_ControlSetInitValue(value)

if (!GMUI_IsControl() && id != global.GMUIiid)
{
    GMUI_ThrowError("Invalid control for GMUI_ControlSetInitValue");
    return false;
}

value = argument0;
valueString = string(argument0);
    
return true;

