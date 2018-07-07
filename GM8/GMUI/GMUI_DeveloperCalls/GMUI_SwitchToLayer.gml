#define GMUI_SwitchToLayer
///GMUI_SwitchToLayer(Layer number)
///Switches the active layer

// Arguments
var SCRIPT,_Layer;
SCRIPT = GMUI_SwitchToLayer;
_Layer = argument0;

// Validate
if (!is_real(_Layer)) {
    GMUI_ThrowErrorDetailed("Invalid parameter",SCRIPT);
    return false;
}

if (!GMUI_LayerExists(_Layer)) {
    GMUI_ThrowErrorDetailed("Layer " + string(_Layer) + " doesn't exist",SCRIPT);
    return false;
}

// If still running the interface script, also switch the creating on layer
if (!(GMUII()).UIInterfaceSet) {
    GMUI_SetOnLayer(_Layer);
}


(GMUII()).UILayerPrevious = (GMUII()).UILayer;
(GMUII()).UILayer = _Layer;

//if ((GMUII()).UIEnableSurfaces) {
//    GMUI_GridUpdateLayer(GMUII(),_Layer);
//}

// .... Disable hovering and selection on all controls


return true;


