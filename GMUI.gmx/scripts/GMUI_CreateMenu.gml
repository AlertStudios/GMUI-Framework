#define GMUI_CreateMenu
///GMUI_CreateMenu (menu name, cell# x, cell# y, cells wide, cells high, Anchor)
///Adds a menu to a GMUI layer that controls can be put into


// Arguments
var _SCRIPT,_CellX,_CellY;
_SCRIPT = GMUI_CreateMenu;
_CellX = argument1;
_CellY = argument2;


// Validate
if (!is_real(_CellX) || !is_real(_CellY)) {
    GMUI_ThrowErrorDetailed("Invalid parameters",_SCRIPT);
    return -1;
}

// Call to create a menu that returns the menu number
GMUI_CreateMenuType(_SCRIPT,string(argument0),_CellX,_CellY,argument3,argument4,argument5);

