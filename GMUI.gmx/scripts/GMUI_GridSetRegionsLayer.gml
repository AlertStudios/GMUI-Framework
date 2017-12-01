/// Set the control regions for the given layer

var _Layer,_Grid;
_Layer = argument0;
_Grid = (GMUII()).GMUI_grid[_Layer];

// Clear grid out first
ds_grid_clear(_Grid,0);

// Loop through all controls in the layer
var i,_ctrl,_CX2,_CY2;
for(i=0;i<ds_list_size((GMUII()).GMUI_controlList);i+=1) {
    // Get control value
    _ctrl = ds_list_find_value((GMUII()).GMUI_controlList,i);
    
    if (!instance_exists(_ctrl)) {
        GMUI_ThrowErrorDetailed("Control no longer exists", GMUI_GridSetRegionsLayer);
    }
    else if (GMUI_ControlIsInLayer(_ctrl,_Layer)) {
        if ((_ctrl).ControlInteraction) {
            // Map the control to the grid[layer#] - Warning: This will overwrite any existing instance values (overlapping)
            _CX2 = (_ctrl).CellX+(_ctrl).CellWide-1+ceil((_ctrl).RelativeX / (GMUII()).cellsize);
            _CY2 = (_ctrl).CellY+(_ctrl).CellHigh-1+ceil((_ctrl).RelativeY / (GMUII()).cellsize_h);
            ds_grid_set_region(_Grid,(_ctrl).CellX,(_ctrl).CellY,_CX2,_CY2,_ctrl);
        }
        
        // Update control draw location in the room
        if ((_ctrl).Layer == _Layer)
            GMUI_ControlUpdateXY(_ctrl);
    }
    
}

