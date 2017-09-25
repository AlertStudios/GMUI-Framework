///GMUI_GridGetMouseCellY(GMUI instance)  Returns the vertical cell block that the mouse is on
// argument0 is the GMUI instance

var _GMUII, _offset;
_GMUII = argument0;
_offset = 0;

if ((_GMUII).UIsnaptoview) {
    _offset = view_yview[(_GMUII).UIgridview];
}

return ceil((mouse_y-(GMUII()).GMUI_grid_y[(GMUII()).UILayer]-_offset+1)/(GMUII()).cellsize_h)-1;


