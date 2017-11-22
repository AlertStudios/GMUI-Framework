///GMUI_GroupSetPositionActual(Layer Number, Group Number, x, y)
///Set a group to a position in the room by x, y

var _LayerNumber, _GroupNumber, _xcord, _ycord, _adjx, _adjy, _offsetx, _offsety;
_LayerNumber = argument0;
_GroupNumber = argument1;
_xcord = argument2;
_ycord = argument3;

// Validate
if (!is_real(_GroupNumber) || !is_real(_LayerNumber) || !is_real(_xcord) || !is_real(_ycord)) {
    GMUI_ThrowError("Invalid parameters for GMUI_GroupSetPositionActual");
    return false;
}

if (!GMUI_LayerExists(_LayerNumber)) {
    GMUI_ThrowError("Layer " + string(_LayerNumber) + " doesn't exist. GMUI_GroupSetPositionActual");
    return false;
}

if (!GMUI_GroupExists(_LayerNumber,_GroupNumber)) {
    GMUI_ThrowError("Group " + string(_GroupNumber) + " doesn't exist on layer " + string(_LayerNumber) + ". GMUI_GroupSetPositionActual");
}

_offsetx = 0;
_offsety = 0;

if ((GMUII()).UIsnaptoview) {
    _offsetx = view_xview[(GMUII()).UIgridview];
    _offsety = view_yview[(GMUII()).UIgridview];
}

_adjx = _xcord - _offsetx - GMUI_CellGetActualX(GMUI_GridGetCellX(GMUII(),_LayerNumber,_xcord));
_adjy = _ycord - _offsety - GMUI_CellGetActualY(GMUI_GridGetCellY(GMUII(),_LayerNumber,_ycord));


// Set position by default anchor (topleft), and adjustment to the given coordinates
GMUI_GroupSetPositionAnchored(_LayerNumber,_GroupNumber,GMUI_GridGetCellX(GMUII(),_LayerNumber,_xcord),GMUI_GridGetCellY(GMUII(),_LayerNumber,_ycord),_adjx,_adjy,0);
