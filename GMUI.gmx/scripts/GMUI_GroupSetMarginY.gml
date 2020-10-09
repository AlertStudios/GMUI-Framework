///GMUI_GroupSetMarginY(Group, Cells height for margin)
///Set the height of the group by margin cells (to edge of grid)

var _LayerNumber, _GroupNumber, _Cells, _Grid;
_LayerNumber = UIAddToLayer;
_GroupNumber = argument0;
_Cells = argument1;
_Grid = GMUI_GridGetHeight(GMUII(),_LayerNumber);


GMUI_groupCellsH[_LayerNumber,_GroupNumber] = max(1, 
    _Grid - GMUI_groupCellY[_LayerNumber,_GroupNumber] - _Cells);
