///GMUI_GridUpdateLayer(GMUI instance, Layer)
///[BETA]Update the draw flag for all controls on the layer
var _i, _g,_ctrl, _Layer;
_Layer = argument1;

with (argument0) {
    if (UIEnableSurfaces) {
    GMUI_gridNeedsDrawUpdate[_Layer] = 1;

        // Loop through all controls in the layer
        for(_i=0;_i<ds_list_size(GMUI_controlList);_i+=1) {
            // Get control value
            _ctrl = ds_list_find_value(GMUI_controlList,_i);
        
            if (!instance_exists(_ctrl)) {
                GMUI_ThrowErrorDetailed("Control no longer exists", GMUI_GridUpdateLayer);
            }
            else if (GMUI_ControlIsInLayer(_ctrl,_Layer)) {
                if (!_ctrl.Hidden)
                    _ctrl.NeedsDrawUpdate = true;
            }
        }
        
        // Set the group updates
        for(_i=0;_i<ds_list_size(GMUI_groupList[_Layer]);_i+=1) {
            _g = ds_list_find_value(GMUI_groupList[_Layer],_i);
            
            if (GMUI_StudioCheckDefined(_g)) {
                (GMUI_groupMasterControl[_Layer,_g]).NeedsGroupUpdate = true;
                (GMUI_groupDrawingControl[_Layer,_g]).NeedsGroupUpdate = true;
            }
        }
    }
} 
