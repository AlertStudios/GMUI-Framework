#define GMUI_GroupSetClickOff
///GMUI_GroupSetClickOff(Layer, Group, Click off to close [1] or not [0])
///This option allows the user to click outside of the menu to close it

var SCRIPT, _Group, _Layer, _clickOff;
SCRIPT = GMUI_GroupSetClickOff;
_Layer = argument0;
_Group = argument1;
_clickOff = (argument2 > 0);

(GMUII()).GMUI_groupClickOff[_Layer,_Group] = _clickOff;

return true;

