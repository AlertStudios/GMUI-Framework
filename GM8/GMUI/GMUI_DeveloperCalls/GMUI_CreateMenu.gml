#define GMUI_CreateMenu
///GMUI_CreateMenu (menu name, cell# x, cell# y, cells wide, cells high, Anchor)
///Adds a menu to a GMUI layer that controls can be put into


// Arguments
var _SCRIPT,_menuName,_CellX,_CellY,_CW,_CH,_Anchor,_menuNumber,_layerNumber;
_SCRIPT = "GMUI_CreateMenu";
_menuName = string(argument0);
_CellX = argument1;
_CellY = argument2;
_CW = argument3;
_CH = argument4;
_Anchor = argument5;


// Validate
if (!is_real(_CellX) || !is_real(_CellY)) {
    GMUI_ThrowErrorDetailed("Invalid parameters",_SCRIPT);
    return -1;
}

// Get menu number and assign name to the ID
(GMUII()).GMUI_menu_lastId += 1;
_menuNumber = (GMUII()).GMUI_menu_lastId;
ds_map_add((GMUII()).GMUI_menu_map,_menuName,_menuNumber);

_layerNumber = (GMUII()).layerDepth_maxLayers - 1;

// Create a group with the assigned layer and group numbers
if (GMUI_CreateGroup(_layerNumber,_menuNumber,_CellX,_CellY,_Anchor)) {
    (GMUII()).GMUI_groupCellsW[_layerNumber,_menuNumber] = _CW;
    (GMUII()).GMUI_groupCellsH[_layerNumber,_menuNumber] = _CH;
}
else
    return -1;


return _menuNumber;

