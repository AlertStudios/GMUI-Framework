///GMUI_GridGetMouseCellX(GMUI instance)  Returns the horizontal cell block that the mouse is on
// argument0 is the GMUI instance
function GMUI_GridGetMouseCellX(argument0) {

var _GMUI, _offset;
_GMUI = argument0;
_offset = GMUI_GridViewOffsetX(_GMUI);


return ceil((mouse_x-(_GMUI).GMUI_grid_x[(_GMUI).UILayer]-_offset+1)/(_GMUI).cellsize)-1;

}

