///GMUI_CreatePopup (popup name, cell# x, cell# y, cells wide, cells high, Anchor)
///Adds a popup to a GMUI layer that has typical control options for prompt


// Arguments
var _SCRIPT,_CellX,_CellY;
_SCRIPT = GMUI_CreatePopup;
_CellX = argument1;
_CellY = argument2;


// Validate
if (!is_real(_CellX) || !is_real(_CellY)) {
    GMUI_ThrowErrorDetailed("Invalid parameters",_SCRIPT);
    return -1;
}

// Call to create a menu that returns the menu number
GMUI_CreateMenuType(_SCRIPT,string(argument0),_CellX,_CellY,argument3,argument4,argument5);
