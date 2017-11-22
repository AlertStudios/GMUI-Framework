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

(GMUII()).UILayerPrevious = (GMUII()).UILayer;
(GMUII()).UILayer = _LayerNumber;


// .... Disable hovering and selection on all controls
