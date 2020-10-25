///GMUI_GridSetControlRegion(grid to add to, control, add [bool] else remove)
function GMUI_GridSetControlRegion(argument0,argument1,argument2) {

var _grid,_ctrl,_add,_CX2,_CY2;
_grid = argument0;
_ctrl = argument1;
_add = argument2 > 0;

_CX2 = _ctrl.CellX+_ctrl.CellWide-1+ceil(_ctrl.RelativeX / (_ctrl.GMUIP).cellsize);
_CY2 = _ctrl.CellY+_ctrl.CellHigh-1+ceil(_ctrl.RelativeY / (_ctrl.GMUIP).cellsize_h);

// Add the control value to the cells, or set to 0 if removing
if (_add) {
    ds_grid_set_region(_grid,_ctrl.CellX,_ctrl.CellY,_CX2,_CY2,_ctrl);
}
else {
    ds_grid_set_region(_grid,_ctrl.CellX,_ctrl.CellY,_CX2,_CY2,0);
}

}

