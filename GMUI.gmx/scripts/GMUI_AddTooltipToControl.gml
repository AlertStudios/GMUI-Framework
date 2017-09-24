#define GMUI_AddTooltipToControl
///GMUI_AddTooltipToControl(Control id, "message string", direction/side of control, width cells [or -1], height cells [or -1], max cells width, max cells height, relative x [or -1], relative y [or -1])
///Adds a tooltip to the specified control

var _SCRIPT, _message, _direction, _relX, _relY, _cellX, _cellY, _newCtrl,
    _width, _height, _newwidth, _newheight, _actwidth, _actheight, _maxwidth, _maxheight, gcellsize;
_SCRIPT = GMUI_AddTooltipToControl;
_ctrl = argument0;
_message = argument1;
_direction = argument2;
_width = argument3;
_height = argument4;
_maxwidth = argument5;
_maxheight = argument6;
_relX = max(0,argument7);
_relY = max(0,argument8);

// Must be control
if (!GMUI_IsControlID(_ctrl)) {
    GMUI_ThrowErrorDetailed("Invalid control",_SCRIPT);
    return -1;
}
// Must have real coordinates
if (!is_real(_relX) || !is_real(_relY)) {
    GMUI_ThrowErrorDetailed("Invalid coordinates",_SCRIPT);
    return -1;
}

if (_direction < 0 || _direction > 8) {
    GMUI_ThrowErrorDetailed("Invalid direction",_SCRIPT);
    return -1;
}

// Adjust sizing based on text given
draw_set_font(((_ctrl).GMUIP).ControlFont);
gcellsize = ((_ctrl).GMUIP).cellsize;

_actwidth = string_width_ext(_message,-1,_maxwidth*gcellsize);
_actheight = string_height_ext(_message,-1,_maxwidth*gcellsize);
_newwidth = ceil(_actwidth/gcellsize);
_newheight = ceil(_actheight/((_ctrl).GMUIP).cellsize_h);


// Create the control to store the tooltip, creating it in an adjacent cell
if (_direction == global.GMUIAnchorBottom) {
    _cellX = (_ctrl).CellX + ceil((_ctrl).CellWide / 2) - ceil(abs(_width) / 2);
    _cellY = (_ctrl).CellY - abs(_height) - 1;
}
else if (_direction == global.GMUIAnchorTop) {
    _cellX = (_ctrl).CellX + ceil((_ctrl).CellWide / 2) - ceil(abs(_width) / 2);
    _cellY = (_ctrl).CellY + (_ctrl).CellHigh + 1;
}
else if (_direction == global.GMUIAnchorRight || _direction == global.GMUIAnchorTopRight || _direction == global.GMUIAnchorBottomRight) {
    _cellX = (_ctrl).CellX - abs(_width) - 1;
    _cellY = (_ctrl).CellY + ceil((_ctrl).CellHigh / 2) - ceil(abs(_height) / 2);
}
else {
    // Left anchored (right side)
    _cellX = (_ctrl).CellX + (_ctrl).CellWide + 1;
    _cellY = (_ctrl).CellY + ceil((_ctrl).CellHigh / 2) - ceil(abs(_height) / 2);
}

newCtrl = GMUI_Add((_ctrl).valueName + "_tooltip","tooltip",_cellX,_cellY,_newwidth,_newheight,(_ctrl).Layer,(_ctrl).Anchor);

with (newCtrl) {
    valueString = _message;
    Hidden = true;
    FadeAlpha = 0;
    FadeIn = max(ControlBackgroundAlpha,ControlHoverAlpha,ControlSelectAlpha,ControlOverwriteAlpha,ControlFontAlpha);
    
    // Set positioning to given relative amount and fit width to content
    GMUI_ControlSetPositioning(_relX,_relY,_actwidth,0);

    // Assign tooltip settings to control...
    TT_minx = _width;
    TT_miny = _height;
    TT_maxx = _maxwidth;
    TT_maxy = _maxheight;
    
    TT_arrowsize = 8;
    TT_xposition = 8;
    TT_yposition = 16;
    TT_direction = _direction;
}

// Store position relative to the parent control
(newCtrl).TT_relativeCellX = _cellX - (_ctrl).CellX;
(newCtrl).TT_relativeCellY = _cellY - (_ctrl).CellY;
// Parent control stores the id
(_ctrl).TooltipId = newCtrl;

return newCtrl;


