#define GMUI_GridGetCellXRoom
///GMUI_GridGetCellXRoom(GMUI instance, Layer, X)  Returns the horizontal cell block by room coordinates
// argument0 is the GMUI instance
// argument1 is the layer
// argument2 is the X coordinate

var _GMUII;
_GMUII = argument0;

return GMUI_GridGetCellXOffset(_GMUII,argument1,argument2,0);



