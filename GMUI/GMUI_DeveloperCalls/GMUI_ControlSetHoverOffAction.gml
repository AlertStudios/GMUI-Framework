///GMUI_ControlSetHoverOffAction(Action Script)
///When hovering off, execute script (can also draw)
function GMUI_ControlSetHoverOffAction(argument0) {

if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowErrorDetailed("Invalid control", GMUI_ControlSetHoverOffAction);
    return false;
}

if (script_exists(argument0)) {
    HoverOffActionScript = argument0;
    return true;
}
else {
    GMUI_ThrowErrorDetailed("Invalid script argument", GMUI_ControlSetHoverOffAction);
}

return false;
}

