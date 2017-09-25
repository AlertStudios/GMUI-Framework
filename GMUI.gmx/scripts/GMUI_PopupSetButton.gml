///GMUI_PopupSetButton("popup name", )
///This option allows the user to click outside of the menu to close it

//todo: put above: GMUI_PopupSetButton("Test Popup", which button, Text or "", graphic or -1, text align, text color on hover)

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

//(GMUII()).GMUI_groupClickOff[_Layer,_menuNumber] = _clickOff;

//todo: Call GMUI_ControlSetButton with whichever button it is


return true;
