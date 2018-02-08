#define GMUI_GridUpdateLayer
///GMUI_GridUpdateLayer(GMUI instance, Layer)
///[BETA]Update the draw flag for all controls on the layer
var _i,_ctrl,_Layer;
_Layer = argument1;

// Currently disabled.
//return true;

with (argument0) {
    // Loop through all controls in the layer
    for(_i=0;_i<ds_list_size(GMUI_controlList);_i+=1) {
        // Get control value
        _ctrl = ds_list_find_value(GMUI_controlList,_i);
    
        if (!instance_exists(_ctrl)) {
            GMUI_ThrowErrorDetailed("Control no longer exists", GMUI_GridUpdateLayer);
        }
        else if (GMUI_ControlIsInLayer(_ctrl,_Layer)) {
            _ctrl.NeedsDrawUpdate = true;
        }
    }
} 

