///GMUI_GridSetNavigation(direction that navigates, back key, forward key, alternate back key [or -1], alternate forward key [or -1], allow tab)
///Set the controls that can navigate through the list
// Called by the GMUI instance in the form or otherwise

var _navdir, _back, _forward, _backalt, _forwardalt, _allowtab;
_navdir = minmax(argument0,0,2); // 3 and 2 count as the same
_back = argument1;
_forward = argument2;
_backalt = argument3;
_forwardalt = argument4;
_allowtab = argument5;

GMUI_navigateDirection = _navdir;
GMUI_backKey = _back;
GMUI_forwardKey = _forward;
GMUI_backAltKey = _backalt;
GMUI_forwardAltKey = _forwardalt;
GMUI_enableTab = _allowtab;

