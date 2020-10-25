///GMUI_MenuSetHidePosition("menu name", Cell X, Cell Y, transition_script [or -1], speed in steps)
// Sets menu position to come from and go to when shown or hidden
function GMUI_MenuSetHidePosition(argument0,argument1,argument2,argument3,argument4) {

// Get menu number and check its valid
var _MenuName, _MenuNumber, _prevLayer, _result;
_MenuName = string(argument0);
_MenuNumber = ds_map_find_value((GMUII()).GMUI_menu_map,_MenuName);

if (string(_MenuNumber) == "0") {
    GMUI_ThrowErrorDetailed("Menu doesn't exist: " + _MenuName,GMUI_MenuSetHidePosition);
    return false;
}

// Set style with the menu, temporary change to setting layer
_prevLayer = UIAddToLayer;
UIAddToLayer = GMUI_GetMenuLayer(GMUII(),_MenuNumber);

_result = GMUI_GroupSetHidePosition(_MenuNumber,argument1,argument2,argument3,argument4);

UIAddToLayer = _prevLayer;
return _result;
}

