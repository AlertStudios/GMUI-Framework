#define GMUI_GroupSetPosition
///GMUI_GroupSetPosition(Layer Number, Group Number, Cell X, Cell Y, X Adjustment, Y Adjustment)
///Change the position of the group (and all of the controls inside it)

// Arguments
var _LayerNumber,_GroupNumber,_CellX,_CellY,_AdjustmentX,_AdjustmentY, ctrl;
_LayerNumber = argument0;
_GroupNumber = argument1;
_CellX = argument2;
_CellY = argument3;
_AdjustmentX = argument4;
_AdjustmentY = argument5;

// Validate
if (!is_real(_GroupNumber) || !is_real(_LayerNumber) || !is_real(_CellX) || !is_real(_CellY)) {
    GMUI_ThrowError("Invalid parameters for GMUI_GroupSetPosition");
    return false;
}

if (_GroupNumber <= 0) {
    GMUI_ThrowError("Group number must be greater than 0");
    return false;
}

if (!GMUI_LayerExists(_LayerNumber)) {
    GMUI_ThrowError("Layer " + string(_LayerNumber) + " doesn't exist. GMUI_GroupSetPosition");
    return false;
}

if (!GMUI_GroupExists(_LayerNumber,_GroupNumber)) {
    GMUI_ThrowError("Group " + string(_GroupNumber) + " doesn't exist on layer " + string(_LayerNumber) + ". GMUI_GroupSetPosition");
    return false;
}

// Set position by anchor of the group
GMUI_GroupSetPositionAnchored(_LayerNumber, _GroupNumber, _CellX, _CellY, _AdjustmentX, _AdjustmentY, (GMUII()).GMUI_groupAnchor[_LayerNumber,_GroupNumber]);

