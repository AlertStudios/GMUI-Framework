/// Set the control regions for the given layer

var _Layer,_Grid;
_Layer = argument0;
_Grid = (GMUII()).GMUI_grid[_Layer];

// Clear grid out first
ds_grid_clear(_Grid,0);

// Loop through all controls in the layer
var i,_ctrl;
for(i=0;i<ds_list_size((GMUII()).GMUI_controlList);i+=1) {
    // Get control value
    _ctrl = ds_list_find_value((GMUII()).GMUI_controlList,i);
    
    if (!instance_exists(_ctrl)) {
        GMUI_ThrowErrorDetailed("Control no longer exists", GMUI_GridSetRegionsLayer);
    }
    else if (GMUI_ControlIsInLayer(_ctrl,_Layer)) {
        if (!_ctrl.Hidden) {
            if (_ctrl.ControlInteraction) {
                // Map the control to the grid[layer#] - Warning: This will overwrite any existing instance values (overlapping)
                GMUI_GridSetControlRegion(_Grid,_ctrl,true);
            }
        }
        
        // Update control draw location in the room
        if ((_ctrl).Layer == _Layer)
            GMUI_ControlUpdateXY(_ctrl);
    }
    
}

