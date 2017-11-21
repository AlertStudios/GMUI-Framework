#define GMUI_PopupSetStyle
///GMUI_PopupSetStyle("popup name", Background Color, Background Alpha, Border color, Border Alpha, Is RoundRect)

var SCRIPT, _menuName, _menuNumber, _Layer;
SCRIPT = GMUI_PopupSetStyle;
_menuName = string(argument0);

// Get menu number and check its valid
_menuNumber = ds_map_find_value((GMUII()).GMUI_popup_map,_menuName);

if (string(_menuNumber) == "0") {
    GMUI_ThrowErrorDetailed("Popup doesn't exist: " + _menuName,SCRIPT);
    return false;
}

_Layer = GMUI_GetMenuLayer(GMUII(),_menuNumber);

// Get master control for menu if it exists
if ((GMUII()).GMUI_groupMasterControl[_Layer,_menuNumber] == -1) {
    GMUI_ThrowErrorDetailed("Control needed for style of popup: " + _menuName,SCRIPT);
    return false;
}

// Call group style assign
with ((GMUII()).GMUI_groupMasterControl[_Layer,_menuNumber]) {
    return GMUI_GroupSetStyle(argument1, argument2, argument3, argument4, argument5);
}

