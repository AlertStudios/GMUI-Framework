///GMUI_ControlUpdateXY(control)
///Updates the actual location in the room after adjustments
function GMUI_ControlUpdateXY(argument0) {

var _ctrl, _GMUIP, _xoffset, _yoffset, _lw, _lh, _sbOffset;
_ctrl = argument0;
_GMUIP = (_ctrl).GMUIP;

if (!GMUI_IsControlID(_ctrl)) {
    GMUI_ThrowErrorDetailed("Invalid control",GMUI_ControlUpdateXY);
    return false;
}

if (_GMUIP.UIEnableSurfaces) {
    _xoffset = 0 - _GMUIP.GMUI_groupActualX[_ctrl.Layer,_ctrl.Group];
    _yoffset = 0 - _GMUIP.GMUI_groupActualY[_ctrl.Layer,_ctrl.Group];
}
else {
    _xoffset = GMUI_GridViewOffsetX(_GMUIP);
    _yoffset = GMUI_GridViewOffsetY(_GMUIP);
}

_lw = GMUI_GridGetWidth((_ctrl).GMUIP,(_ctrl).Layer);
_lh = GMUI_GridGetHeight((_ctrl).GMUIP,(_ctrl).Layer);

// X,Y position
(_ctrl).RoomX = (_ctrl).ActualX + (_ctrl).RelativeX + (_GMUIP).GMUI_grid_x[(_ctrl).Layer] + _xoffset;
(_ctrl).RoomY = (_ctrl).ActualY + (_ctrl).RelativeY + (_GMUIP).GMUI_grid_y[(_ctrl).Layer] + _yoffset;

// Width and height
if ((_ctrl).ActualW > 0) {
    (_ctrl).RoomW = (_ctrl).RoomX + (_ctrl).ActualW;
}
else {
    (_ctrl).RoomW = (_ctrl).RoomX + (_ctrl).CellWide * (_GMUIP).cellsize;
}
    
if ((_ctrl).ActualH > 0) {
    (_ctrl).RoomH = (_ctrl).RoomY + (_ctrl).ActualH;
}
else {
    (_ctrl).RoomH = (_ctrl).RoomY + (_ctrl).CellHigh * (_GMUIP).cellsize_h;
}
    
// If the control has a tooltip, update the tooltip location (based on top-left)
if ((_ctrl).TooltipId != -1) {
    GMUI_ControlPosition((_ctrl).TooltipId,
        (_ctrl).CellX + ((_ctrl).TooltipId).TT_relativeCellX,
        (_ctrl).CellY + ((_ctrl).TooltipId).TT_relativeCellY,
        ((_ctrl).TooltipId).RelativeX,
        ((_ctrl).TooltipId).RelativeY,
        global.GMUIAnchorTopLeft);
    ((_ctrl).TooltipId).NeedsPositionUpdate = true;
}

// If the control has a scrollbar, update the scrollbar location (copied from GMUI_ControlSetScrollbarDefaults)
if ((_ctrl).ControlHasScrollbar && !_GMUIP.UIEnableSurfaces) {
    (_ctrl).Scrollbar_x = (_ctrl).ActualX + (_ctrl).CellWide * _GMUIP.cellsize
        - (_ctrl).Scrollbar_width
        - _GMUIP.GMUI_grid_x[(_ctrl).Layer] - GMUI_GridViewOffsetX(_GMUIP);
    _sbOffset = (_ctrl).Scrollbar_pos_y - (_ctrl).Scrollbar_y;
    (_ctrl).Scrollbar_y = (_ctrl).ActualY - _GMUIP.GMUI_grid_y[(_ctrl).Layer] - GMUI_GridViewOffsetY(_GMUIP) + (_ctrl).Scrollbar_padding*2;
    (_ctrl).Scrollbar_pos_y = (_ctrl).Scrollbar_y + _sbOffset;
}
//draw_text(0,16,"updating positioning :(");
}

