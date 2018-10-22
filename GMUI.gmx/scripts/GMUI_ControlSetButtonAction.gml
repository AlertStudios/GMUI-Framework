///GMUI_ControlSetButtonAction(Action Script)
if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowErrorDetailed("Invalid control", GMUI_ControlSetButtonAction);
    return false;
}

if (script_exists(argument0)) {
    ActionScript = argument0;
    return true;
}
else {
    GMUI_ThrowErrorDetailed("Invalid script argument", GMUI_ControlSetButtonAction);
}

return false;
    
