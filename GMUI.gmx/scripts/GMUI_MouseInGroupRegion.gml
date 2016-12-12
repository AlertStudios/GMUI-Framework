///GMUI_MouseInGroupRegion(group number, layer number)
///Returns if the mouse is in the bounds of the group

var _Group, _Layer, _mouseCellX, _mouseCellY;
_Group = argument0;
_Layer = argument1;

// Check the parameters
if (!GMUI_LayerExists(_Layer)) {
    GMUI_ThrowError("Layer " + string(_Layer) + " doesn't exist. GMUI_GroupSetPosition");
    return false;
}

if (!GMUI_GroupExists(_Layer,_Group)) {
    GMUI_ThrowError("Group " + string(_Group) + " doesn't exist on layer " + string(_Layer) + ". GMUI_GroupSetPosition");
    return false;
}

_mouseCellX = GMUI_GridGetMouseCellX(mouse_x);
_mouseCellY = GMUI_GridGetMouseCellY(mouse_y);

if (_mouseCellX < (GMUII()).GMUI_groupCellX[_Layer,_Group] || _mouseCellY < (GMUII()).GMUI_groupCellY[_Layer,_Group] || 
    _mouseCellX > (GMUII()).GMUI_groupCellX[_Layer,_Group] + (GMUII()).GMUI_groupCellsW[_Layer,_Group] ||
    _mouseCellY > (GMUII()).GMUI_groupCellY[_Layer,_Group] + (GMUII()).GMUI_groupCellsH[_Layer,_Group]) {
    return false;
}

return true;

