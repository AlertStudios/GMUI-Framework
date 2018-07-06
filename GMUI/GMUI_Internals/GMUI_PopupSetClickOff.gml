#define GMUI_PopupSetClickOff
///GMUI_PopupSetClickOff("popup name", Click off to close [1] or not [0])
///This option allows the user to click outside of the menu to close it

var SCRIPT, _menuName, _menuNumber, _Layer, _clickOff;
SCRIPT = GMUI_PopupSetClickOff;
_menuName = string(argument0);
_clickOff = (argument1 > 0);

// Get menu number and check its valid
_menuNumber = ds_map_find_value((GMUII()).GMUI_popup_map,_menuName);

if (string(_menuNumber) == "0") {
    GMUI_ThrowErrorDetailed("Popup doesn't exist: " + _menuName,SCRIPT);
    return false;
}

_Layer = GMUI_GetMenuLayer(GMUII(),_menuNumber);

(GMUII()).GMUI_groupClickOff[_Layer,_menuNumber] = _clickOff;

return true;

