#define GMUI_GridGetCellXRoom
///GMUI_GridGetCellXRoom(GMUI instance, Layer, X)  Returns the horizontal cell block by room coordinates
// argument0 is the GMUI instance
// argument1 is the layer
// argument2 is the X coordinate

var _GMUII,_offset;
_GMUII = argument0;
_offset = 0;

if ((_GMUII).UIsnaptoview) {
    _offset = -view_xview[(_GMUII).UIgridview];
}

return GMUI_GridGetCellXOffset(_GMUII,argument1,argument2,_offset);



