#define GMUI_ControlSetScrollbarDefaults
///GMUI_ControlSetScrollbarDefaults(set for control[true] or for group[false])
///Set the default variables for the scrollbar
// This is called after the interface if in group and the overflow is set to scroll

var _GMUI, _Layer, _Group, _CH,_GH,_OF;
_GMUI = GMUIP;
_Layer = Layer;
_Group = Group;

_CH = (_GMUI).cellsize_h;
if (argument0) {
    _GH = CellHigh;
    _OF = _GH; //temporary
}
else {
    _GH = (_GMUI).GMUI_groupCellsH[_Layer,_Group];
    _OF = (_GMUI).GMUI_groupOverflowCellsH[_Layer,_Group];
}
    

GroupScrollbarCalculated = true;
//GroupOverflowHeight = 0;
Scrollbar_x = 0;
Scrollbar_y = 0;
Scrollbar_pos_y = 0; // Position of the interact scrollbar
Scrollbar_width = (_GMUI).cellsize;
Scrollbar_height = 0;
Scrollbar_max = 0;
Scrollbar_maxtop = 0;
Scrollbar_hover = false;
Scrollbar_dragging = false;
Scrollbar_drag_y = 0;
Scrollbar_padding = 0;
Scrollbar_bgcolor = c_dkgray;
Scrollbar_bgalpha = 0.8;
Scrollbar_bgcolor_hover = c_dkgray;
Scrollbar_bgalpha_hover = 1;
Scrollbar_color = c_gray;
Scrollbar_alpha = 0.8;
Scrollbar_color_hover = c_gray;
Scrollbar_alpha_hover = 1;

// Calculate sizing of scrollbar
if (_GH > 0) {
    Scrollbar_max = _GH * _CH;

    Scrollbar_height = max((_GMUI).cellsize_h, _GH / _OF * Scrollbar_max) - Scrollbar_padding*2;
    
    Scrollbar_maxtop = Scrollbar_max - Scrollbar_height;
    
    // Calculate the scrollbar position: X + W - scrollbar W - gridX - offset
    if (argument0) {
        Scrollbar_x = ActualX + CellWide * (_GMUI).cellsize
            - Scrollbar_width
            - _GMUI.GMUI_grid_x[_Layer] - GMUI_GridViewOffsetX(_GMUI);
        Scrollbar_y = ActualY - _GMUI.GMUI_grid_y[_Layer] - GMUI_GridViewOffsetY(_GMUI) + Scrollbar_padding*2;
        Scrollbar_pos_y = Scrollbar_y;
    }
    else {
        GMUI_GroupSetScrollbarX(_GMUI,_Layer,_Group);
        
        GMUI_GroupSetScrollbar(_GMUI, id);
    }
}

return true;

