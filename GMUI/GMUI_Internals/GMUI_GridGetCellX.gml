///GMUI_GridGetCellX(GMUI instance, Layer, X)  Returns the horizontal cell block that the mouse is on
// argument0 is the GMUI instance
// argument1 is the layer
// argument2 is the X coordinate

var _GMUII,_offset;
_GMUII = argument0;
_offset = GMUI_GridViewOffsetX(_GMUII);

return GMUI_GridGetCellXOffset(_GMUII,argument1,argument2,_offset);
//return ceil((argument2-(_GMUI).GMUI_grid_x[_LayerNumber]-_offset+1)/(_GMUI).cellsize)-1;



