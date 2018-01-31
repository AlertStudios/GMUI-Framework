#define GMUI_SwitchToLayer
///GMUI_SwitchToLayer(Layer number)
///Switches the active layer

// Arguments
var SCRIPT,_LayerNumber;
SCRIPT = GMUI_SwitchToLayer;
_LayerNumber = argument0;

// Validate
if (!is_real(_LayerNumber)) {
    GMUI_ThrowErrorDetailed("Invalid parameter",SCRIPT);
    return false;
}

if (!GMUI_LayerExists(_LayerNumber)) {
    GMUI_ThrowErrorDetailed("Layer " + string(_LayerNumber) + " doesn't exist",SCRIPT);
    return false;
}

// If still running the interface script, also switch the creating on layer
if (!(GMUII()).UIInterfaceSet) {
    GMUI_SetOnLayer(_LayerNumber);
}


(GMUII()).UILayerPrevious = (GMUII()).UILayer;
(GMUII()).UILayer = _LayerNumber;

// .... Disable hovering and selection on all controls


return true;


