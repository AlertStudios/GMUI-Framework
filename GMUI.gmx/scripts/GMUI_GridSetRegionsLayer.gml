#define GMUI_GridSetRegionsLayer
/// Set the control regions for the given layer

var _Layer,_Grid;
_Layer = argument0;
_Grid = (GMUII()).GMUI_grid[_Layer];

// Clear grid out first
ds_grid_clear(_Grid,0);

// Loop through all controls in the layer
var i,ctrl,_CX2,_CY2;
for(i=0;i<ds_list_size((GMUII()).GMUI_controlList);i+=1) {
    // Get control value
    ctrl = ds_list_find_value((GMUII()).GMUI_controlList,i);
    
    if (!instance_exists(ctrl)) {
        GMUI_ThrowError("Control no longer exists. GMUI_GridSetRegionsLayer()");
    }
    else if ((ctrl).Layer == _Layer) {
        if ((ctrl).ControlInteraction) {
            // Map the control to the grid[layer#] - Warning: This will overwrite any existing instance values (overlapping)
            _CX2 = (ctrl).CellX+(ctrl).CellWide-1+ceil((ctrl).RelativeX / (GMUII()).cellsize);
            _CY2 = (ctrl).CellY+(ctrl).CellHigh-1+ceil((ctrl).RelativeY / (GMUII()).cellsize_h);
            ds_grid_set_region(_Grid,(ctrl).CellX,(ctrl).CellY,_CX2,_CY2,ctrl);
        }
        
        // Update control draw location in the room
        GMUI_ControlUpdateXY(ctrl);
    }
    
}

