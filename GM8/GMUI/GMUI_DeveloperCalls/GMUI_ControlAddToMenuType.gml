#define GMUI_ControlAddToMenuType
///GMUI_ControlAddToMenuType(script [menu type], "menu name")
///Adds control to a group if it exists in the layer

var SCRIPT, _menuName, _menuNumber, _Layer;
SCRIPT = argument0;
_menuName = string(argument1);

// Must be control
if (!GMUI_IsControl()) {
    GMUI_ThrowErrorDetailed("Invalid control",SCRIPT);
    return false;
}

// Get menu number and check its valid
switch (SCRIPT) {
    case GMUI_ControlAddToPopup:
        _menuNumber = ds_map_find_value((GMUIP).GMUI_popup_map,_menuName);
        break;
    case GMUI_ControlAddToMenu:
    default:
        _menuNumber = ds_map_find_value((GMUIP).GMUI_menu_map,_menuName);
        break;
}


if (string(_menuNumber) == "0") {
    GMUI_ThrowErrorDetailed("Menu doesn't exist: " + _menuName,SCRIPT);
    return false;
}

// Control must have a layer that exists (should always be the case)
// Layer value exists in the control
_Layer = GMUI_GetMenuLayer(GMUIP,_menuNumber);
if (!GMUI_LayerExists(_Layer)) {
    GMUI_ThrowErrorDetailed("Control in layer that doesn't exist: " + string(id),SCRIPT);
    return false;
}

if (!GMUI_GroupExists(_Layer,_menuNumber)) {
    GMUI_ThrowErrorDetailed("Menu "+ _menuName +" doesn't exist for adding control: " + string(valueName),SCRIPT);
    return false;
}

// Assign the control to the menu layer; master control will be reassigned to the exact menu layer (instead of -1)
depth = GMUI_MenuControlDepth(GMUIP,_menuNumber,ControlType) - 1;
Layer = _Layer;

// Finally call the layer and group of the menu to add the control to
if (!GMUI_ControlAddToGroup(_menuNumber))
    return false;

// Menus hidden by default if not on that layer
if ((GMUIP).UILayer < (GMUIP).GMUI_menu_layer || (GMUIP).UILayer != (GMUIP).GMUI_menuCurrent) {
    GMUI_GroupHide(_menuNumber,_Layer,true);
    GroupHidden = true;
}

return true;
    
    

