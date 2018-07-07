///GMUI_ControlSetValueChangedAction(Action Script)
///On changed value, execute script (can also draw)

if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowErrorDetailed("Invalid control", GMUI_ControlSetValueChangedAction);
    return false;
}

if (script_exists(argument0)) {
    ValueChangedActionScript = argument0;
    return true;
}
else {
    GMUI_ThrowErrorDetailed("Invalid script argument", GMUI_ControlSetValueChangedAction);
}

return false;
    

