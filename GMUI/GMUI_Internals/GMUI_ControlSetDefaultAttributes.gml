///GMUI_ControlSetDefaultAttributes(id)
/// Set the default attributes of the control from the controller
function GMUI_ControlSetDefaultAttributes(argument0) {

if (!instance_exists(argument0))
{
    GMUI_ThrowError("Invalid control for GMUI_ControlSetDefaultAttributes");
    return false;
}

with (argument0)
{
    GMUI_ControlSetAttributes(
    (GMUII()).ControlMaxStringLength,
    (GMUII()).ControlMaxDecimalLength,
    (GMUII()).ControlMinValue,
    (GMUII()).ControlMaxValue
    );
}


return true;
}

