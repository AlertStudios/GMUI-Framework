#define GMUI_GroupSetPosition
///GMUI_GroupSetPosition(Group Number, Cell X, Cell Y, X Adjustment, Y Adjustment)
///Change the position of the group (and all of the controls inside it)

// Arguments
var _SCRIPT,_LayerNumber,_GroupNumber,_CellX,_CellY,_AdjustmentX,_AdjustmentY;
_SCRIPT = GMUI_GroupSetPosition;
_LayerNumber = (GMUII()).UIAddToLayer;
_GroupNumber = argument0;
_CellX = argument1;
_CellY = argument2;
_AdjustmentX = argument3;
_AdjustmentY = argument4;

// Validate
if (!is_real(_GroupNumber) || !is_real(_CellX) || !is_real(_CellY)) {
    GMUI_ThrowErrorDetailed("Invalid parameters",_SCRIPT);
    return false;
}

if (!GMUI_GroupExists(_LayerNumber,_GroupNumber)) {
    GMUI_ThrowErrorDetailed("Group " + string(_GroupNumber) + " doesn't exist on layer " + string(_LayerNumber),_SCRIPT);
    return false;
}

// Set position by anchor of the group
GMUI_GroupSetPositionAnchored(_LayerNumber, _GroupNumber, _CellX, _CellY, _AdjustmentX, _AdjustmentY, (GMUII()).GMUI_groupAnchor[_LayerNumber,_GroupNumber]);



