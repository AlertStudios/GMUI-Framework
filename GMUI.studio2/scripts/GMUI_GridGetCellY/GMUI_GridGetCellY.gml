///GMUI_GridGetCellY(GMUI instance, Layer, Y)  Returns the vertical cell block by coordinate
// argument0 is the GMUI instance
// argument1 is the layer
// argument2 is the Y coordinate

var _GMUII,_offset;
_GMUII = argument0;
_offset = GMUI_GridViewOffsetY(_GMUII);

return GMUI_GridGetCellYOffset(_GMUII,argument1,argument2,_offset);
//return ceil((argument2-(_GMUII).GMUI_grid_y[_LayerNumber]-_offset+1)/(_GMUII).cellsize_h)-1;



