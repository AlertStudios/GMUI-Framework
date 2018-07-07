///GMUI_GridGetCellYOffset(GMUI instance, Layer, Y, Offset Y)  Returns the vertical cell block of coordinate
// argument0 is the GMUI instance
// argument1 is the layer
// argument2 is the Y coordinate
// argument3 is the Y offset

var _GMUII, _LayerNumber, _offset;
_GMUII = argument0;
_LayerNumber = argument1;
_offset = argument3;

return ceil((argument2-(_GMUII).GMUI_grid_y[_LayerNumber]-_offset+1)/(_GMUII).cellsize_h)-1;



