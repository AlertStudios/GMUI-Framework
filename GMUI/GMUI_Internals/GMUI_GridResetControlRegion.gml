///GMUI_GridResetControlRegion(Layer, previous CellX, previous CellY, Cell Width, Cell Height, control id)
/// Resets any control values in the control's previous region


var _Layer, _pCellX, _pCellY, _CellW, _CellH, _CtrlId;
_Layer = argument0;
_pCellX = argument1;
_pCellY = argument2;
_CellW = argument3;
_CellH = argument4;
_CtrlId = argument5;

// Loop through region to reset control value to 0
var i,j;
for (i=0;i<_CellW;i+=1) {
    for (j=0;j<_CellH;j+=1) {
        if (ds_grid_get((GMUII()).GMUI_grid[_Layer],_pCellX+i,_pCellY+j) == _CtrlId) {
                ds_grid_set((GMUII()).GMUI_grid[_Layer],_pCellX+i,_pCellY+j,0);
        }
    }
}

