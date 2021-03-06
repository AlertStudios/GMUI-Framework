///GMUI_ControlScrollbarSelect(control id with scrollbar, X cordinate, Y cordinate)
///Adjust the scrollbar to the position
function GMUI_ControlScrollbarSelect(argument0,argument1,argument2) {

var _SCRIPT,_Ctrl, _MX, _MY, _relY;
_SCRIPT = GMUI_ControlScrollbarSelect;
_Ctrl = argument0;
_MX = argument1;
_MY = argument2;

if (_Ctrl.ControlHasScrollbar) {
    // Calculate the relative positioning, if able
    with (_Ctrl) {
    if (Scrollbar_maxtop > Scrollbar_padding) {
        _relY = _MY-GMUIP.GMUI_grid_y[Layer]-GMUI_GridViewOffsetY(GMUIP) - Scrollbar_y - Scrollbar_drag_y;
        
        if (_Ctrl.Group > 0 && _Ctrl.GMUIP.UIEnableSurfaces)
            _relY -= (_Ctrl.GMUIP).GMUI_groupActualY[_Ctrl.Layer,_Ctrl.Group];
    
        Scrollbar_pos_y = GMUIminmax(Scrollbar_y + _relY, Scrollbar_y + Scrollbar_padding, Scrollbar_y + Scrollbar_maxtop);

        // Pixel-based suface offset
        ItemListOffsetY = (Scrollbar_pos_y - Scrollbar_y + Scrollbar_padding) / Scrollbar_maxtop * 
            (ItemListHeight * (ItemListSize - floor(ItemListAreaHeight/ItemListHeight)));
    }
    }
    return true;
}
else
    GMUI_ThrowErrorDetailed("Control " + _Ctrl.valueName + " does not have scrollbar",_SCRIPT);
    
return false;
}

