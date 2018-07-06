#define GMUI_GroupSetStretchToGrid
///GMUI_GroupSetStretchToGrid(Group, Stretch Direction)
///Stretch group to edges

var _Layer, _Group, _Direction;
_Layer = UIAddToLayer;
_Group = argument0;
_Direction = argument1;

GMUI_groupStretch[_Layer,_Group] = _Direction;

// Left/Right: Stretches to height
// Top/Bottom: Stretches to width
// TopLeft/TopRight/BottomLeft/BottomRight: Stretches to its corner
// Center: Stretches to make square

// Resize group?
// (Also resize if setting size after)



