#define GMUI_ControlActionScript
///GMUI_ControlActionScript(control object) Runs the script assigned to the control, if there is one

if (!GMUI_IsControlID(argument0))
{
    GMUI_ThrowError("Invalid control for GMUI_ActionScript");
    return false;
}

if ((argument0).ActionScript == -1) {
    GMUI_ThrowError("Action for " + (argument0).valueName +" not implemented");
}
else if (!script_exists((argument0).ActionScript)) {
    GMUI_ThrowError("Invalid script assigned to " + (argument0).valueName + " : " + string((argument0).ActionScript));
}
else {
    script_execute((argument0).ActionScript);
    return true;
}

return false;

