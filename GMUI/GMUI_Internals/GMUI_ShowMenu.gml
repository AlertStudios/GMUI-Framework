///GMUI_ShowMenu("menu name", show[1] or hide[0], animate [bool])

// Arguments
var _SCRIPT,_menuName,_animate, _show, _menuNumber;
_SCRIPT = GMUI_ShowMenu;
_menuName = string(argument0);
_show = (argument1 > 0);
_animate = argument2;

// Get menu number
_menuNumber = ds_map_find_value((GMUII()).GMUI_menu_map,_menuName);

if (string(_menuNumber) == "0")
    return false;
    

return GMUI_ShowMenuId(_menuNumber,_show,_animate);

