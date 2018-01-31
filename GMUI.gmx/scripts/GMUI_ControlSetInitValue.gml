///GMUI_ControlSetInitValue(value)
///Set the 'default' value (value/string) for the control, but not the actual value


if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowErrorDetailed("Invalid control", GMUI_ControlSetInitValue);
    return false;
}

value = argument0;
valueString = string(argument0);

    
return true;
