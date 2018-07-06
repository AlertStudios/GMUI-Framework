#define GMUI_MenuSetStyle
///GMUI_MenuSetStyle("menu name", Background Color, Background Alpha, Border color, Border Alpha, Is RoundRect)

var _SCRIPT, _MenuName, _MenuNumber, _result, _prevLayer;
_SCRIPT = GMUI_MenuSetStyle;
_MenuName = string(argument0);

// Get menu number and check its valid
_MenuNumber = ds_map_find_value((GMUII()).GMUI_menu_map,_MenuName);

if (string(_MenuNumber) == "0") {
    GMUI_ThrowErrorDetailed("Menu doesn't exist: " + _MenuName,_SCRIPT);
    return false;
}

// Set style with the menu, temporary change to setting layer
_prevLayer = UIAddToLayer;
UIAddToLayer = GMUI_GetMenuLayer(GMUII(),_MenuNumber);

_result =  GMUI_GroupSetStyle(_MenuNumber, argument1, argument2, argument3, argument4, argument5);

UIAddToLayer = _prevLayer;
return _result;

