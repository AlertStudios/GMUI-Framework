///GMUI_ControlAddToMenu("menu name")
///Adds control to a group if it exists in the layer
function GMUI_ControlAddToMenu(argument0) {

var SCRIPT, _menuName;
SCRIPT = GMUI_ControlAddToMenu;
_menuName = string(argument0);

return GMUI_ControlAddToMenuType(SCRIPT,_menuName);
}

