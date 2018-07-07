///GMUI_PopupSetStyle("popup name", Background Color, Background Alpha, Border color, Border Alpha, Is RoundRect)

var _SCRIPT, _menuName, _menuNumber, _prevLayer;
_SCRIPT = GMUI_PopupSetStyle;
_menuName = string(argument0);

// Get menu number and check its valid
_menuNumber = ds_map_find_value((GMUII()).GMUI_popup_map,_menuName);

if (string(_menuNumber) == "0") {
    GMUI_ThrowErrorDetailed("Popup doesn't exist: " + _menuName,_SCRIPT);
    return false;
}

// Set style with the popup, temporary change to setting layer
_prevLayer = (GMUII()).UIAddToLayer;
(GMUII()).UIAddToLayer = GMUI_GetMenuLayer(GMUII(),_menuNumber);

_result =  GMUI_GroupSetStyle(_menuNumber, argument1, argument2, argument3, argument4, argument5);

(GMUII()).UIAddToLayer = _prevLayer;
return _result;

