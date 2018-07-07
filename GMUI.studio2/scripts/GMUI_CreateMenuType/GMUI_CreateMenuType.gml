///GMUI_CreateMenuType (Type[script calling], menu name, cell# x, cell# y, cells wide, cells high, Anchor)
///Adds a menu to a GMUI layer that controls can be put into


// Arguments
var _SCRIPT,_GMUI,_menuName,_CellX,_CellY,_CW,_CH,_Anchor,_menuNumber,_layerNumber, _menuType, _prevLayer;
_SCRIPT = GMUI_CreateMenuType;
_GMUI = GMUII();
_menuScript = argument0;
_menuName = string(argument1);
_CellX = argument2;
_CellY = argument3;
_CW = argument4;
_CH = argument5;
_Anchor = argument6;


// Validate
if (!is_real(_CellX) || !is_real(_CellY)) {
    GMUI_ThrowErrorDetailed("Invalid parameters",_SCRIPT);
    return -1;
}

// Get menu number and assign name to the ID
(_GMUI).GMUI_menuLastId += 1;
_menuNumber = (_GMUI).GMUI_menuLastId;
switch (_menuScript) {
    case GMUI_CreatePopup: ds_map_add((_GMUI).GMUI_popup_map,_menuName,_menuNumber);
        break;
    case GMUI_CreateWarning: ds_map_add((_GMUI).GMUI_warnings_map,_menuName,_menuNumber);
        break;
    default:
    case GMUI_CreateMenu: ds_map_add((_GMUI).GMUI_menu_map,_menuName,_menuNumber);
        break;
}

_prevLayer = (_GMUI).UIAddToLayer;
_layerNumber = GMUI_GetMenuLayer(_GMUI,_menuNumber);
if (!GMUI_LayerExists(_layerNumber)) {
    GMUI_AddLayer(_layerNumber,(_GMUI).GMUI_defaultX,(_GMUI).GMUI_defaultY);
}

// Create a group with the assigned layer and group numbers
if (GMUI_CreateGroup(_menuNumber,_CellX,_CellY,_Anchor)) {
    (_GMUI).GMUI_groupCellsW[_layerNumber,_menuNumber] = _CW;
    (_GMUI).GMUI_groupCellsH[_layerNumber,_menuNumber] = _CH;
    (_GMUI).GMUI_groupClickOff[_layerNumber,_menuNumber] = false;
    (_GMUI).GMUI_groupAction[_layerNumber,_menuNumber] = -1;
    UIAddToLayer = _prevLayer;
}
else {
    UIAddToLayer = _prevLayer;
    return -1;
}


return _menuNumber;

