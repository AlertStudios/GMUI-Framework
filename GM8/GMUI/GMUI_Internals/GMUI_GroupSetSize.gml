#define GMUI_GroupSetSize
/// Set the cell size of the group
//GMUI_GroupSetSize(Group, cells wide, cells high, Layer)

var _groupNumber, _CellsW, _CellsH, _layerNumber;
_groupNumber = argument0;
_CellsW = argument1;
_CellsH = argument2;
_layerNumber = argument3;

GMUI_groupCellsW[_layerNumber,_groupNumber] = _CellsW;
GMUI_groupCellsH[_layerNumber,_groupNumber] = _CellsH;

