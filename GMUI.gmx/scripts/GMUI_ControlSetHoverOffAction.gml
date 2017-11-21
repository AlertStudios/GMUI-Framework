#define GMUI_ControlSetHoverOffAction
///GMUI_ControlSetHoverOffAction(Action Script)
///When hovering off, execute script (can also draw)

if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowError("Invalid control for GMUI_ControlSetHoverOffAction");
    return false;
}

if (script_exists(argument0)) {
    HoverOffActionScript = argument0;
    return true;
}
else {
    GMUI_ThrowError("Invalid script argument for GMUI_ControlSetHoverOffAction");
}

return false;
    

