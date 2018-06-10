#define GMUI_ControlListOffset
///GMUI_ControlListOffset(control id with List, Using Surface[bool], Mouse X, Mouse Y)
///Return the offset amount of the list and update the hover index based on mouse position

var _SCRIPT, _Ctrl, _offset, _relMY, _UsingSurface, _MX;
_SCRIPT = GMUI_ControlListOffset;
_Ctrl = argument0;
_UsingSurface = argument1;
_MX = argument2;
_offset = 0;
_relMY = 0;

if (!instance_exists(_Ctrl)) {
    GMUI_ThrowErrorDetailed("Control " + string(_Ctrl) + " doesn't exist!", _SCRIPT);
    return 0;
}

if (_Ctrl.ControlItemList) {
    // Get the relative mouse position to the control
    _relMY = argument3 - _Ctrl.RoomY;
    
    with (_Ctrl) {
        // Return index offset for non-surface, or Y offset for surfaces
        if (!_UsingSurface)
            _offset = floor((ItemListOffsetY+(ItemListHeight/2))/ItemListHeight);
        else if (ControlHasScrollbar) {
            if (Scrollbar_dragging)
                _offset = (Scrollbar_pos_y - Scrollbar_y) / Scrollbar_maxtop
                    * ((ItemListSize - floor(ItemListAreaHeight / ItemListHeight)) * ItemListHeight);
            else
                _offset = ItemListOffsetY;
        }
        else if (Hovering)
            _offset = minmax(_relMY,0,RoomY + RoomH) / (RoomY - RoomH)
                * ((ItemListSize - ceil(ItemListAreaHeight / ItemListHeight)) * ItemListHeight);
        else
            _offset = ItemListOffsetY;
        
        // When hovering, also update the hover index
        if (Hovering) {
            if (!_UsingSurface)
                ItemListHoverIndex = floor(_relMY / ItemListHeight) + _offset + 1;
            else
                ItemListHoverIndex = floor((_relMY + ItemListOffsetY) / ItemListHeight) + 1;
            
            if (ItemListHoverIndex > ItemListSize)
                ItemListHoverIndex = -1;
        }
    }

    return _offset;
}
else
    GMUI_ThrowErrorDetailed("Control " + _Ctrl.valueName + " is not a list control",_SCRIPT);
    
return 0;


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

