///GMUI_MenuSetHidePosition("menu name", Cell X, Cell Y, transition_script [or -1], speed in steps)
// Sets menu position to come from and go to when shown or hidden

// Get menu number and check its valid
var _MenuName, _MenuNumber;
_MenuName = string(argument0);
_MenuNumber = ds_map_find_value((GMUII()).GMUI_menu_map,_MenuName);

if (string(_MenuNumber) == "0") {
    GMUI_ThrowErrorDetailed("Menu doesn't exist: " + _MenuName,GMUI_MenuSetHidePosition);
    return false;
}

GMUI_GroupSetHidePosition(GMUI_GetMenuLayer(GMUII(),_MenuNumber),_MenuNumber,argument1,argument2,argument3,argument4);
