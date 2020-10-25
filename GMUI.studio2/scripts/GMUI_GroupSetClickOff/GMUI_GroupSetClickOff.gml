///GMUI_GroupSetClickOff(Group, Click off to close [1] or not [0])
///This option allows the user to click outside of the menu to close it

function GMUI_GroupSetClickOff(argument0,argument1) {

var _Group, _Layer, _clickOff;
_Layer = UIAddToLayer;
_Group = argument0;
_clickOff = (argument1 > 0);

(GMUII()).GMUI_groupClickOff[_Layer,_Group] = _clickOff;

return true;
}

