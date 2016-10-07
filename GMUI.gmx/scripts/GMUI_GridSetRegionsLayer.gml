///GMUI_GridSetRegionsLayer(Layer Number)
///Set the control regions for the given layer

var _Layer,_Grid;
_Layer = argument0;
_Grid = (GMUII()).GMUI_grid[_Layer];

// Clear grid out first
ds_grid_clear(_Grid,0);

// Loop through all controls in the layer
var i,ctrl;
for(i=0;i<ds_list_size((GMUII()).GMUI_controlList);i+=1) {
    // Get control value
    ctrl = ds_list_find_value((GMUII()).GMUI_controlList,i);
    
    if (!instance_exists(ctrl)) {
        GMUI_ThrowError("Control no longer exists. GMUI_GridSetRegionsLayer()");
    }
    else if ((ctrl).Layer == _Layer) {
        // Map the control to the grid[layer#] - Warning: This will overwrite any existing instance values (overlapping)
        ds_grid_set_region(_Grid,(ctrl).CellX,(ctrl).CellY,(ctrl).CellX+(ctrl).CellWide-1,(ctrl).CellY+(ctrl).CellHigh-1,ctrl);
    }
    
}
