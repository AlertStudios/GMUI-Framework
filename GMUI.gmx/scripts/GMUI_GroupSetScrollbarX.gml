///GMUI_GroupSetScrollbarX(GMUI instance, Layer number, Group number)
///Set the scrollbar x position to the master control of group

var _GMUI, _Layer, _Group, _DC, _SBC;
_GMUI = argument0;
_Layer = argument1;
_Group = argument2;

if (_GMUI.UIEnableSurfaces)
    _DC = _GMUI.GMUI_groupDrawingControl[_Layer,_Group];
else
    return false; // Currently not supported

if (_DC > -1) {
    _SBC = _DC.GroupScrollbarHandler;

    // Calculate the scrollbar position: X + W - scrollbar W - gridX - offset
    // (Based from GMUI_GridViewOffsetX and GMUI_GridGetCellXOffset)
    _SBC.Scrollbar_x = _GMUI.GMUI_groupActualX[_Layer,_Group]
        + _GMUI.GMUI_groupCellsW[_Layer,_Group] * (_GMUI).cellsize
        - _GMUI.GMUI_groupScrollWidth[_Layer,_Group]
        - _GMUI.GMUI_grid_x[_Layer] - GMUI_GridViewOffsetX(_GMUI);
        
    return true;
}

return false;
