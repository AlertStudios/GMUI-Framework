///GMUI_ControlSetButtonAction(Action Script)
if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowError("Invalid control for GMUI_ControlSetButtonAction");
    return false;
}

if (script_exists(argument0)) {
    ActionScript = argument0;
    return true;
}
else {
    GMUI_ThrowError("Invalid script argument for GMUI_ControlSetButtonAction");
}

return false;
    
