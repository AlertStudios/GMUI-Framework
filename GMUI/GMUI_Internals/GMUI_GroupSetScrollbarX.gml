#define GMUI_GroupSetScrollbarX
///GMUI_GroupSetScrollbarX(GMUI instance, Layer number, Group number)
///Set the scrollbar x position to the master control of group

var _GMUI, _Layer, _Group, _MC;
_GMUI = argument0;
_Layer = argument1;
_Group = argument2;
_MC = _GMUI.GMUI_groupMasterControl[_Layer,_Group];

// Calculate the scrollbar position: X + W - scrollbar W - gridX - offset
// (Based from GMUI_GridViewOffsetX and GMUI_GridGetCellXOffset)
_MC.Scrollbar_x = _GMUI.GMUI_groupActualX[_Layer,_Group]
    + _GMUI.GMUI_groupCellsW[_Layer,_Group] * (_GMUI).cellsize
    - _GMUI.GMUI_groupScrollWidth[_Layer,_Group]
    - _GMUI.GMUI_grid_x[_Layer] - GMUI_GridViewOffsetX(_GMUI);

