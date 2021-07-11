///GMUI_ControlSetDisabledDraw(Action Script)
///When disabling, execute script
function GMUI_ControlSetDisabledDraw(argument0) {
if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowErrorDetailed("Invalid control", GMUI_ControlSetDisabledDraw);
    return false;
}

if (script_exists(argument0)) {
    DisableActionScript = argument0;
    return true;
}
else {
    GMUI_ThrowErrorDetailed("Invalid script argument", GMUI_ControlSetDisabledDraw);
}

return false;
}

