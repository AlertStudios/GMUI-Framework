///GMUI_PopupSetAction("popup name", Script to execute)
///Action to execute after responding to the popup

var _SCRIPT, _menuName, _menuNumber;
_SCRIPT = GMUI_PopupSetAction;
_menuName = string(argument0);

// Get menu number and check its valid
_menuNumber = ds_map_find_value((GMUII()).GMUI_popup_map,_menuName);

if (string(_menuNumber) == "0") {
    GMUI_ThrowErrorDetailed("Popup doesn't exist: " + _menuName,_SCRIPT);
    return false;
}

(GMUII()).GMUI_groupAction[GMUI_GetMenuLayer(GMUII(),_menuNumber),_menuNumber] = argument1;

return true;

