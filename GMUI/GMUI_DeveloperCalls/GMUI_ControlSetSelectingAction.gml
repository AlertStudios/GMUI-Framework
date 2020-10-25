///GMUI_ControlSetSelectingAction(Action Script)
///On initial selection, execute script (can also draw)
function GMUI_ControlSetSelectingAction(argument0) {
if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowError("Invalid control for GMUI_ControlSetSelectingAction");
    return false;
}

if (script_exists(argument0)) {
    SelectingActionScript = argument0;
    return true;
}
else {
    GMUI_ThrowError("Invalid script argument for GMUI_ControlSetSelectingAction");
}

return false;
}

