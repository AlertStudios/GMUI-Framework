///GMUI_CloseMenu(animate [bool])
///Close the current open menu
function GMUI_CloseMenu(argument0) {

// Arguments
var _animate;
_animate = (argument0 > 0);

if ((GMUII()).GMUI_menuCurrent == 0)
    return false;
    

return GMUI_ShowMenuId((GMUII()).GMUI_menuCurrent,false,_animate);
}

