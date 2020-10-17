///GMUI_MenuSetPosition("menu name", Cell X, Cell Y, X Adjustment, Y Adjustment)
// Sets menu position
function GMUI_MenuSetPosition(argument0,argument1,argument2,argument3,argument4) {

// Get menu number and check its valid
var _MenuName, _MenuNumber, _MenuLayer;
_MenuName = string(argument0);
_MenuNumber = ds_map_find_value((GMUII()).GMUI_menu_map,_MenuName);

if (string(_MenuNumber) == "0") {
    GMUI_ThrowErrorDetailed("Menu doesn't exist: " + _MenuName,GMUI_MenuSetPosition);
    return false;
}

_MenuLayer = GMUI_GetMenuLayer(GMUII(),_MenuNumber);

// Set position by anchor of the group
GMUI_GroupSetPositionAnchored(_MenuLayer, _MenuNumber, argument1, argument2, argument3, argument4, (GMUII()).GMUI_groupAnchor[_MenuLayer,_MenuNumber]);
}

