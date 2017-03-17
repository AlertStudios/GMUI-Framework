///GMUI_GroupSetSize(Layer, Group, cells wide, cells high)
///Set the cell size of the group

var _groupNumber, _CellsW, _CellsH, _layerNumber;
_layerNumber = argument0;
_groupNumber = argument1;
_CellsW = argument2;
_CellsH = argument3;


GMUI_groupCellsW[_layerNumber,_groupNumber] = _CellsW;
GMUI_groupCellsH[_layerNumber,_groupNumber] = _CellsH;
