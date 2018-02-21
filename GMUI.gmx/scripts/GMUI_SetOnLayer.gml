///GMUI_SetOnLayer(Layer number)
/// Switches the layer to create / modify on

// Arguments
var _SCRIPT,_LayerNumber;
_SCRIPT = GMUI_SetOnLayer;
_LayerNumber = argument0;

// Validate
if (!is_real(_LayerNumber)) {
    GMUI_ThrowErrorDetailed("Invalid parameter",_SCRIPT);
    return false;
}

if (!GMUI_LayerExists(_LayerNumber)) {
    GMUI_ThrowErrorDetailed("Layer " + string(_LayerNumber) + " doesn't exist",_SCRIPT);
    return false;
}

// Check that the interface has been set, if not it may still be running the interface script
UIAddToLayer = _LayerNumber;

return true;

