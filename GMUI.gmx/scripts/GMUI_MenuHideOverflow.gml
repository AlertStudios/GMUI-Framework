///GMUI_MenuHideOverflow("Menu Name")
///Set the method for overflowing menus, and scrollbar with if necessary

var _GMUI, _Layer, _menuName, _menuNumber, _Direction, _MC;
_GMUI = GMUII();
_Layer = UIAddToLayer;
_menuName = string(argument0);

// Get menu number and check its valid
_menuNumber = ds_map_find_value(_GMUI.GMUI_menu_map,_menuName);

if (string(_menuNumber) == "0") {
    GMUI_ThrowErrorDetailed("Menu doesn't exist: " + _menuName,GMUI_MenuHideOverflow);
    return false;
}

_Layer = GMUI_GetMenuLayer(_GMUI,_menuNumber);

_GMUI.GMUI_groupOverflow[_Layer,_menuNumber] = global.GMUIOverflowNone;

//GMUIOverflowNone = 0;
//GMUIOverflowResize = 1;
//GMUIOverflowScroll = 2;


