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
    _relMY = argument3 - _Ctrl.RoomY - (_Ctrl.GMUIP.GMUI_grid_y[_Ctrl.Layer] + GMUI_GridViewOffsetY(_Ctrl.GMUIP))*_UsingSurface;
    
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
            _offset = minmax(_relMY,0,RoomY + RoomH + GMUI_GridViewOffsetY(_Ctrl.GMUIP)*_UsingSurface) / (RoomY - RoomH)
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

