///GMUI_ControlPersistentToLayer(Layer persistent to)
///Allow the control to be enabled for all layers between the main layer, and the one provided
function GMUI_ControlPersistentToLayer(argument0) {

if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowErrorDetailed("Invalid control", GMUI_ControlPersistentToLayer);
    return false;
}

if (GMUI_LayerExists(argument0)) {
    AdditionalLayer = argument0;
}
else {
    GMUI_ThrowErrorDetailed("Layer does not exist (yet?)", GMUI_ControlPersistentToLayer);
}
}

