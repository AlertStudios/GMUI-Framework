#define GMUI_CreateMenuType
///GMUI_CreateMenuType (Type[script calling], menu name, cell# x, cell# y, cells wide, cells high, Anchor)
///Adds a menu to a GMUI layer that controls can be put into


// Arguments
var _SCRIPT,_GMUII,_menuName,_CellX,_CellY,_CW,_CH,_Anchor,_menuNumber,_layerNumber, _menuType;
_SCRIPT = GMUI_CreateMenuType;
_GMUII = GMUII();
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
(GMUII()).GMUI_menuLastId += 1;
_menuNumber = (GMUII()).GMUI_menuLastId;
switch (_menuScript) {
    case GMUI_CreatePopup: ds_map_add((_GMUII).GMUI_popup_map,_menuName,_menuNumber);
        break;
    case GMUI_CreateWarning: ds_map_add((_GMUII).GMUI_warnings_map,_menuName,_menuNumber);
        break;
    default:
    case GMUI_CreateMenu: ds_map_add((_GMUII).GMUI_menu_map,_menuName,_menuNumber);
        break;
}


_layerNumber = GMUI_GetMenuLayer(_GMUII,_menuNumber);
if (!GMUI_LayerExists(_layerNumber)) {
    GMUI_AddLayer(_layerNumber,(_GMUII).GMUI_defaultX,(_GMUII).GMUI_defaultY);
}


// Create a group with the assigned layer and group numbers
if (GMUI_CreateGroup(_layerNumber,_menuNumber,_CellX,_CellY,_Anchor)) {
    (_GMUII).GMUI_groupCellsW[_layerNumber,_menuNumber] = _CW;
    (_GMUII).GMUI_groupCellsH[_layerNumber,_menuNumber] = _CH;
    (_GMUII).GMUI_groupClickOff[_layerNumber,_menuNumber] = false;
}
else
    return -1;


return _menuNumber;

