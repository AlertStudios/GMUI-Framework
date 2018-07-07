///GMUI_MenuControlDepth(GMUI, Menu Number, ControlType)
///Returns the depth for the menu and control's type value

var _GMUII, _MenuNumber, _ControlType;
_GMUII = argument0;
_MenuNumber = argument1;
_ControlType = argument2;


return (_GMUII).layerDepth_menus-((_MenuNumber)*4) 
    - (_ControlType=="tooltip");

