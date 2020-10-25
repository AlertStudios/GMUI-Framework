///GMUI_GroupSetSize(Group, cells wide, cells high)
///Set the cell size of the group
function GMUI_GroupSetSize(argument0,argument1,argument2) {

var _groupNumber, _CellsW, _CellsH, _layerNumber;
_layerNumber = UIAddToLayer;
_groupNumber = argument0;
_CellsW = argument1;
_CellsH = argument2;


GMUI_groupCellsW[_layerNumber,_groupNumber] = _CellsW;
GMUI_groupCellsH[_layerNumber,_groupNumber] = _CellsH;
}

