///GMUI_ControlAddToPopup("popup name")
///Adds control to a group if it exists in the layer
function GMUI_ControlAddToPopup(argument0) {

var SCRIPT, _menuName;
SCRIPT = GMUI_ControlAddToPopup;
_menuName = string(argument0);

return GMUI_ControlAddToMenuType(SCRIPT,_menuName);
}

