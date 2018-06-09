#define GMUI_ControlScrollbarSelect
///GMUI_ControlScrollbarSelect(control id with scrollbar, X cordinate, Y cordinate)
///Adjust the scrollbar to the position

var _SCRIPT,_Ctrl, _MX, _MY, _relY;
_SCRIPT = GMUI_ControlScrollbarSelect;
_Ctrl = argument0;
_MX = argument1;
_MY = argument2;

//Scrollbar_x
//Scrollbar_y
//Scrollbar_drag_y
//Scrollbar_max = 0;
//Scrollbar_maxtop = 0;
//Scrollbar_height = 0;
//Scrollbar_padding = 0;
if (_Ctrl.ControlHasScrollbar) {
    // Calculate the relative positioning, if able
    with (_Ctrl) {
    if (Scrollbar_maxtop > Scrollbar_padding) {
        _relY = _MY-GMUIP.GMUI_grid_y[Layer]-GMUI_GridViewOffsetY(GMUIP) - Scrollbar_y - Scrollbar_drag_y;
    
        Scrollbar_pos_y = minmax(Scrollbar_y + _relY, Scrollbar_y + Scrollbar_padding, Scrollbar_y + Scrollbar_maxtop);

        // Pixel-based suface offset
        ItemListOffsetY = (Scrollbar_pos_y - Scrollbar_y + Scrollbar_padding) / Scrollbar_maxtop * 
            (ItemListHeight * (ItemListSize - floor(ItemListAreaHeight/ItemListHeight)));
    }
    }
        //draw_text(200,100,string(_relY));
        //draw_text(200,116,string(_Ctrl.Scrollbar_pos_y));
        //draw_text(200,132,string(_Ctrl.ItemListOffsetY));
        //draw_text(200,148,string(_Ctrl.Scrollbar_maxtop));
        //draw_text(264,148,string(_Ctrl.Scrollbar_height));
    return true;
}
else
    GMUI_ThrowErrorDetailed("Control " + _Ctrl.valueName + " does not have scrollbar",_SCRIPT);
    
return false;


/***************************************************
    var _MC, _MPos; _MC = GMUI_GroupMouseOnScrollbar(id, MX);
    if (_MC > -1) {
        _MC.Scrollbar_dragging = true;
        _MPos = MY - GMUI_groupActualY[_MC.Layer,_MC.Group];
        if (_MPos > _MC.Scrollbar_y && _MPos < _MC.Scrollbar_y + _MC.Scrollbar_height)
            _MC.Scrollbar_drag_y = _MPos - _MC.Scrollbar_y;
        else
            _MC.Scrollbar_drag_y = _MC.Scrollbar_height/2;
    }
 ***************************************************/

// Calculate sizing of scrollbar
//if (_GH > 0) {
//    Scrollbar_max = _GH * _CH;

//    Scrollbar_height = max((_GMUI).cellsize_h, _GH / _OF * Scrollbar_max) - Scrollbar_padding*2;
    
//    Scrollbar_maxtop = Scrollbar_max - Scrollbar_height - Scrollbar_padding;
    
//    // Calculate the scrollbar position: X + W - scrollbar W - gridX - offset
//    if (argument0) {
//        Scrollbar_x = ActualX + CellWide * (_GMUI).cellsize
//            - Scrollbar_width
//            - _GMUI.GMUI_grid_x[_Layer] - GMUI_GridViewOffsetX(_GMUI);
//        Scrollbar_y = ActualY - _GMUI.GMUI_grid_y[_Layer] - GMUI_GridViewOffsetY(_GMUI);
//    }
//    else {
//        GMUI_GroupSetScrollbarX(_GMUI,_Layer,_Group);
//        
//        GMUI_GroupSetScrollbar(_GMUI, id);
//    }
//}

