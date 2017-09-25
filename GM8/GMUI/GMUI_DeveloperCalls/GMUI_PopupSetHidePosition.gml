#define GMUI_PopupSetHidePosition
///GMUI_PopupSetHidePosition("popup name", Cell X, Cell Y, transition_script [or -1], speed in steps)
// Sets popup position to come from and go to when shown or hidden

// Get popup number and check its valid
var _MenuName, _MenuNumber;
_MenuName = string(argument0);
_MenuNumber = ds_map_find_value((GMUII()).GMUI_popup_map,_MenuName);

if (string(_MenuNumber) == "0") {
    GMUI_ThrowErrorDetailed("Popup doesn't exist: " + _MenuName,GMUI_PopupSetHidePosition);
    return false;
}

GMUI_GroupSetHidePosition(GMUI_GetMenuLayer(GMUII(),_MenuNumber),_MenuNumber,argument1,argument2,argument3,argument4);

