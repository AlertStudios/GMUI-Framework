///GMUI_ControlSetHoverAction(Action Script)
///When hovering, execute script (can also draw)

if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowErrorDetailed("Invalid control", GMUI_ControlSetHoverAction);
    return false;
}

if (script_exists(argument0)) {
    HoverActionScript = argument0;
    return true;
}
else {
    GMUI_ThrowErrorDetailed("Invalid script argument", GMUI_ControlSetHoverAction);
}

return false;
    

