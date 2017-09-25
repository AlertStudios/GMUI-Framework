///GMUI_GridGetMouseCellX(GMUI instance)  Returns the horizontal cell block that the mouse is on
// argument0 is the GMUI instance

var _GMUII, _offset;
_GMUII = argument0;
_offset = 0;

if ((_GMUII).UIsnaptoview) {
    _offset = view_xview[(_GMUII).UIgridview];
}


return ceil((mouse_x-(_GMUII).GMUI_grid_x[(_GMUII).UILayer]-_offset+1)/(_GMUII).cellsize)-1;


