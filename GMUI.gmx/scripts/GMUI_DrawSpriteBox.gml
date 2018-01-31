///GMUI_DrawSpriteBox(GMUI instance, Layer, Group, Control[0] / Group [1] / Menu[2], Alpha)
///Draws the box of the specified type

var _GMUII, _layer, _group, _bType, _alpha;
_GMUII = argument0;
_layer = argument1;
_group = argument2;
_bType = argument3;
_alpha = minmax(argument4,0,1);

var _dbx, _dby, _dbw, _dbh, _xoffset, _yoffset, _spr_width, _spr_height, _spr_isFixed,
    _sprTopLeft, _sprTop, _sprTopRight, _sprRight, _sprBottomRight, _sprBottom, _sprBottomLeft, _sprLeft, _sprCenter;

if ((_GMUII).UIsnaptoview) {
    _xoffset = view_xview[(_GMUII).UIgridview];
    _yoffset = view_yview[(_GMUII).UIgridview];
}

if (_bType == 0) {
    // Control
    if (!ControlGraphicMapIsUsed)
        return false;
    
    // dimensions
    _dbx = RoomX;
    _dby = RoomY;
    _dbw = CellWide * (GMUIP).cellsize;
    _dbh = CellHigh * (GMUIP).cellsize_h;
    _spr_width = sprite_get_width(ControlGraphicTopLeft);
    _spr_height = sprite_get_height(ControlGraphicTopLeft);
    
    _sprTopLeft = ControlGraphicTopLeft;
    _sprTop = ControlGraphicTop;
    _sprTopRight = ControlGraphicTopRight;
    _sprRight = ControlGraphicRight;
    _sprBottomRight = ControlGraphicBottomRight;
    _sprBottom = ControlGraphicBottom;
    _sprBottomLeft = ControlGraphicBottomLeft;
    _sprLeft = ControlGraphicLeft;
    
    _sprCenter = ControlGraphicCenter;
    _spr_isFixed = ControlGraphicCenterIsFixed;
}
else if (_bType == 1) {
    // Group
    if (!(_GMUII).GMUI_groupGraphicMapIsUsed[_layer,_group])
        return false;
        
    // dimensions
    _dbx = (_GMUII).GMUI_groupActualX[_layer,_group] + (_GMUII).GMUI_grid_x[_layer] + _xoffset;
    _dby = (_GMUII).GMUI_groupActualY[_layer,_group] + (_GMUII).GMUI_grid_y[_layer] + _yoffset;
    _dbw = (_GMUII).GMUI_groupCellsW[_layer,_group]*(_GMUII).cellsize + (_GMUII).GMUI_grid_x[_layer,_group];
    _dbh = (_GMUII).GMUI_groupCellsH[_layer,_group]*(_GMUII).cellsize_h + (_GMUII).GMUI_grid_y[_layer,_group];
    _spr_width = sprite_get_width((_GMUII).GMUI_groupGraphicTopLeft[_layer,_group]);
    _spr_height = sprite_get_height((_GMUII).GMUI_groupGraphicTopLeft[_layer,_group]);
    
    _sprTopLeft = (_GMUII).GMUI_groupGraphicTopLeft[_layer,_group];
    _sprTop = (_GMUII).GMUI_groupGraphicTop[_layer,_group];
    _sprTopRight = (_GMUII).GMUI_groupGraphicTopRight[_layer,_group];
    _sprRight = (_GMUII).GMUI_groupGraphicRight[_layer,_group];
    _sprBottomRight = (_GMUII).GMUI_groupGraphicBottomRight[_layer,_group];
    _sprBottom = (_GMUII).GMUI_groupGraphicBottom[_layer,_group];
    _sprBottomLeft = (_GMUII).GMUI_groupGraphicBottomLeft[_layer,_group];
    _sprLeft = (_GMUII).GMUI_groupGraphicLeft[_layer,_group];
    
    _sprCenter = (_GMUII).GMUI_groupGraphicCenter[_layer,_group];
    _spr_isFixed = (_GMUII).GMUI_groupGraphicCenterIsFixed[_layer,_group];
}
else if (_bType == 2) {
    // Menu
    
    // dimensions
}

// Draw the box based on the dimensions and sprites gathered 
// top left
draw_sprite_ext(_sprTopLeft,-1,_dbx,_dby,1,1,0,c_white,_alpha);

// top
draw_sprite_stretched_ext(_sprTop,-1,_dbx+_spr_width,_dby,_dbw-_spr_width*2,sprite_get_height(_sprTop),c_white,_alpha);//_spr_height);

// top right
draw_sprite_ext(_sprTopRight,-1,_dbx+_dbw-_spr_width,_dby,1,1,0,c_white,_alpha);

// right
draw_sprite_stretched_ext(_sprRight,-1,_dbx+_dbw-_spr_width,_dby+_spr_height,_spr_width,_dbh-_spr_height,c_white,_alpha);

// bottom right
draw_sprite_ext(_sprBottomRight,-1,_dbx+_dbw-_spr_width,_dby+_dbh-_spr_height,1,1,0,c_white,_alpha);

// bottom
draw_sprite_stretched_ext(_sprBottom,-1,_dbx+_spr_width,_dby+_dbh-_spr_height,_dbw-_spr_width*2,sprite_get_width(_sprBottom),c_white,_alpha);

// bottom left
draw_sprite_ext(_sprBottomLeft,-1,_dbx,_dby+_dbh-_spr_height,1,1,0,c_white,_alpha);

// left
draw_sprite_stretched_ext(_sprLeft,-1,_dbx,_dby+_spr_height,_spr_width,_dbh-_spr_height,c_white,_alpha);


// center (either partial or stretched to fit)
if (_spr_isFixed) {
    draw_sprite_part_ext(_sprCenter,-1,0,0,_dbw-_spr_width*2,_dbh-_spr_height*2,_dbx+_spr_width,_dby+_spr_height,1,1,c_white,_alpha);
}
else {
    draw_sprite_stretched_ext(_sprCenter,-1,_dbx+_spr_width,_dby+_spr_height,_dbw-_spr_width*2,_dbh-_spr_height*2,c_white,_alpha);
}
