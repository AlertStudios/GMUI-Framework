///GMUI_GridGetCellYRoom(GMUI instance, Layer, Y)  Returns the vertical cell block by room coordinates
// argument0 is the GMUI instance
// argument1 is the layer
// argument2 is the Y coordinate

var _GMUII,_offset;
_GMUII = argument0;
_offset = 0;

if ((_GMUII).UIsnaptoview) {
    _offset = -view_yview[(_GMUII).UIgridview];
}

return GMUI_GridGetCellYOffset(_GMUII,argument1,argument2,_offset);



