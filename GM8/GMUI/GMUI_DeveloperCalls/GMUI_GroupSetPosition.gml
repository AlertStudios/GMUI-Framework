#define GMUI_GroupSetPosition
///GMUI_GroupSetPosition(Layer Number, Group Number, Cell X, Cell Y, X Adjustment, Y Adjustment)
///Change the position of the group (and all of the controls inside it)

// Arguments
var SCRIPT,_LayerNumber,_GroupNumber,_CellX,_CellY,_AdjustmentX,_AdjustmentY;
SCRIPT = "GMUI_GroupSetPosition";
_LayerNumber = argument0;
_GroupNumber = argument1;
_CellX = argument2;
_CellY = argument3;
_AdjustmentX = argument4;
_AdjustmentY = argument5;

// Validate
if (!is_real(_GroupNumber) || !is_real(_LayerNumber) || !is_real(_CellX) || !is_real(_CellY)) {
    GMUI_ThrowErrorDetailed("Invalid parameters",SCRIPT);
    return false;
}

if (!GMUI_LayerExists(_LayerNumber)) {
    GMUI_ThrowErrorDetailed("Layer " + string(_LayerNumber) + " doesn't exist",SCRIPT);
    return false;
}

if (!GMUI_GroupExists(_LayerNumber,_GroupNumber)) {
    GMUI_ThrowErrorDetailed("Group " + string(_GroupNumber) + " doesn't exist on layer " + string(_LayerNumber),SCRIPT);
    return false;
}

// Set position by anchor of the group
GMUI_GroupSetPositionAnchored(_LayerNumber, _GroupNumber, _CellX, _CellY, _AdjustmentX, _AdjustmentY, (GMUII()).GMUI_groupAnchor[_LayerNumber,_GroupNumber]);

