///GMUI_GroupStretchToGrid(Group, true/false)
///Stretch group to edges
function GMUI_GroupStretchToGrid(argument0,argument1) {

var _Layer, _Group, _Stretch;
_Layer = (GMUII()).UIAddToLayer;
_Group = argument0;

// Set the stretch flag
_Stretch = false;
if (is_string(argument1)) {
    if (string_lower(argument1) == "true")
        _Stretch = true;
}
else {
    if (argument1)
        _Stretch = true;
}

(GMUII()).GMUI_groupStretch[_Layer,_Group] = _Stretch;

GMUI_GroupSetPositionAnchored(_Layer, _Group,
    (GMUII()).GMUI_groupCellX[_Layer,_Group],
    (GMUII()).GMUI_groupCellY[_Layer,_Group],
    (GMUII()).GMUI_groupRelativeX[_Layer,_Group],
    (GMUII()).GMUI_groupRelativeY[_Layer,_Group],
    (GMUII()).GMUI_groupAnchor[_Layer,_Group]);

// GMUIDirectionType.Vertical: Stretches to height
// GMUIDirectionType.Horizontal: Stretches to width


// TopLeft/TopRight/BottomLeft/BottomRight: Stretches to its corner
// Center: No stretching (default)

// Resize group?
// (Also resize if setting size after)

}

