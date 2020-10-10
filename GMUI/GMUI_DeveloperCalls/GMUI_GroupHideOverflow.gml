///GMUI_GroupHideOverflow(Group)
///Set the method for overflowing groups, and scrollbar with if necessary
function GMUI_GroupHideOverflow(argument0) {
var _GMUI, _Layer, _Group, _Direction, _MC;
_GMUI = GMUII();
_Layer = UIAddToLayer;
_Group = argument0;


_GMUI.GMUI_groupOverflow[_Layer,_Group] = global.GMUIOverflowNone;

//GMUIOverflowNone = 0;
//GMUIOverflowResize = 1;
//GMUIOverflowScroll = 2;

}

