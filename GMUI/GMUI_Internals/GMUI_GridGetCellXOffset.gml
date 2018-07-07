///GMUI_GridGetCellXOffset(GMUI instance, Layer, X, Offset X)  Returns the horizontal cell block of coordinate
// argument0 is the GMUI instance
// argument1 is the layer
// argument2 is the X coordinate
// argument3 is the X offset

var _GMUII, _LayerNumber, _offset;
_GMUII = argument0;
_LayerNumber = argument1;
_offset = argument3;

return ceil((argument2-(_GMUII).GMUI_grid_x[_LayerNumber]-_offset+1)/(_GMUII).cellsize)-1;



