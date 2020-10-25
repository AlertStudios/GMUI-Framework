///GMUI_GridGetMouseCellY(GMUI instance)  Returns the vertical cell block that the mouse is on
// argument0 is the GMUI instance
function GMUI_GridGetMouseCellY(argument0) {

var _GMUI, _offset;
_GMUI = argument0;
_offset = GMUI_GridViewOffsetY(_GMUI);

return ceil((mouse_y-(_GMUI).GMUI_grid_y[(_GMUI).UILayer]-_offset+1)/(_GMUI).cellsize_h)-1;

}

