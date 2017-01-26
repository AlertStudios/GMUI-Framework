///GMUI_GridGetCellX(GMUI instance, Layer, X)  Returns the horizontal cell block that the mouse is on
// argument0 is the GMUI instance
// argument1 is the layer
// argument2 is the X coordinate

var _GMUII,_offset;
_GMUII = argument0;
_offset = 0;

if ((_GMUII).UIsnaptoview) {
    _offset = view_xview[(_GMUII).UIgridview];
}

return GMUI_GridGetCellXOffset(_GMUII,argument1,argument2,_offset);
//return ceil((argument2-(_GMUII).GMUI_grid_x[_LayerNumber]-_offset+1)/(_GMUII).cellsize)-1;


