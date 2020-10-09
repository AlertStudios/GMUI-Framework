///GMUI_GroupSetMarginX(Group, Cells wide for margin)
///Set the width of the group by margin cells (to edge of grid)

var _LayerNumber, _GroupNumber, _Cells, _Grid;
_LayerNumber = UIAddToLayer;
_GroupNumber = argument0;
_Cells = argument1;
_Grid = GMUI_GridGetWidth(GMUII(),_LayerNumber);


GMUI_groupCellsW[_LayerNumber,_GroupNumber] = max(1, 
    _Grid - GMUI_groupCellX[_LayerNumber,_GroupNumber] - _Cells);

