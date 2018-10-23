///GMUI_ControlSetButtonAction1(Action Script, script argument0)
// Set the control button action, also with an argument
if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowErrorDetailed("Invalid control", GMUI_ControlSetButtonAction1);
    return false;
}

if (script_exists(argument0)) {
    ActionScript = argument0;
    ActionScriptArgument = 1;
    ActionArgument0 = argument1;
    return true;
}
else {
    GMUI_ThrowErrorDetailed("Invalid script argument", GMUI_ControlSetButtonAction1);
}

return false;
    

