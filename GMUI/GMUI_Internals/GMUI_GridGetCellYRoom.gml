///GMUI_GridGetCellYRoom(GMUI instance, Layer, Y)  Returns the vertical cell block by room coordinates
// argument0 is the GMUI instance
// argument1 is the layer
// argument2 is the Y coordinate
function GMUI_GridGetCellYRoom(argument0,argument1,argument2) {

var _GMUII;
_GMUII = argument0;

return GMUI_GridGetCellYOffset(_GMUII,argument1,argument2,0);

}

