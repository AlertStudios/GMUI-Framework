///GMUI_AddTooltipToControl(Control id, "message string", direction/side of control, width cells [or -1], height cells [or -1], max cells width, max cells height, adjustment x [or -1], adjustment y [or -1])
///Adds a tooltip to the specified control

var _SCRIPT, _message, _direction, _adjX, _adjY, _relX, _relY, _cellX, _cellY, _newCtrl, _isVertical,
    _width, _height, _newwidth, _newheight, _actwidth, _actheight, _maxwidth, _maxheight, gcellsize, gcellsize_h;
_SCRIPT = GMUI_AddTooltipToControl;
_ctrl = argument0;
_message = argument1;
_direction = argument2;
_width = argument3;
_height = argument4;
_maxwidth = argument5;
_maxheight = argument6;
_adjX = max(0,argument7);
_adjY = max(0,argument8);

// Must be control
if (!GMUI_IsControlID(_ctrl)) {
    GMUI_ThrowErrorDetailed("Invalid control",_SCRIPT);
    return -1;
}
// Must have real coordinates
if (!is_real(_adjX) || !is_real(_adjY)) {
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
gcellsize_h = ((_ctrl).GMUIP).cellsize_h;

// Max must be at least the set size
_maxwidth = gcellsize*max(_maxwidth,_width);
_maxheight = gcellsize_h*max(_maxheight,_height);

// Compare string to the max (seems to not work so we'll just compare sizes anyway)
_actwidth = string_width_ext(_message,-1,_maxwidth);
_actheight = string_height_ext(_message,-1,_maxheight);

// Snap to the string width, unless it hits the max
if (_maxwidth > 0)
    _newwidth = ceil(min(_actwidth,_maxwidth)/gcellsize);
else {
    _newwidth = ceil(_actwidth/gcellsize);
    _maxwidth = _actwidth;
}
// Only enforce max if both max values are not set
if (_maxheight > 0 && _maxwidth <= 0)
    _newheight = floor(min(_actheight,_maxheight)/gcellsize_h);
else {
    _newheight = floor(_actheight/gcellsize_h);
    _maxheight = _actheight;   
}

_isVertical = false;

// Create the control to store the tooltip, creating it in an adjacent cell
if (_direction == global.GMUIAnchorBottom) {
    _relX = ceil((_ctrl).CellWide / 2) - ceil(abs(_width) / 2);
    _relY = 0 - abs(_newheight) - 1;
    _isVertical = true;
}
else if (_direction == global.GMUIAnchorTop) {
    _relX = ceil((_ctrl).CellWide / 2) - ceil(abs(_width) / 2);
    _relY = (_ctrl).CellHigh + 1;
    _isVertical = true;
}
else if (_direction == global.GMUIAnchorRight || _direction == global.GMUIAnchorTopRight || _direction == global.GMUIAnchorBottomRight) {
    _relX = 0 - abs(_newwidth) - 1;
    _relY = floor((_ctrl).CellHigh / 2) - ceil(abs(_height) / 2);
}
else {// Left anchored (right side)
    _relX = (_ctrl).CellWide + 1;
    _relY = floor((_ctrl).CellHigh / 2) - ceil(abs(_height) / 2);
}
_cellX = (_ctrl).CellX + _relX;
_cellY = (_ctrl).CellY + _relY;

// Add new control based on top-left position (updated on GMUI_ControlUpdateXY)
// Use GMUII to temporarily set the adding layer, then revert after
newCtrl = GMUI_AddToLayer((_ctrl).Layer,(_ctrl).valueName + "_tooltip","tooltip",_cellX,_cellY, _newwidth,_newheight,global.GMUIAnchorTopLeft);

with (newCtrl) {
    valueString = _message;
    Hidden = true;
    FadeAlpha = 0;
    FadeIn = max(ControlBackgroundAlpha,ControlHoverAlpha,ControlSelectAlpha,ControlOverwriteAlpha,ControlFontAlpha);
    
    // Set positioning to given relative amount and fit width to content
    GMUI_ControlSetPositioning(_adjX,_adjY,_actwidth,0);

    // Assign tooltip settings to control...
    TT_minx = _width;
    TT_miny = _height;
    TT_maxx = ceil(_maxwidth/gcellsize);
    TT_maxy = ceil(_maxheight/gcellsize_h);
    
    // Adjustable later?
    TT_arrowsize = 8;
    TT_yposition = gcellsize_h;
    if (_isVertical) {
        TT_xposition = floor(abs(_width)/2)*gcellsize - (gcellsize/2);
        TT_yposition -= 2;
    }
    else
        TT_xposition = gcellsize/2;
        
    
    TT_direction = _direction;
}

// Store position relative to the parent control
(newCtrl).TT_relativeCellX = _relX;
(newCtrl).TT_relativeCellY = _relY;

// Parent control stores the id
(_ctrl).TooltipId = newCtrl;

return newCtrl;


