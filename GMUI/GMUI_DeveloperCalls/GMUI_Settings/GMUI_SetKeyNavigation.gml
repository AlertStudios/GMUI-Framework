///GMUI_SetKeyNavigation(direction that navigates, back key, forward key, alternate back key [or -1], alternate forward key [or -1], allow tab key)
///Set the controls that can navigate through the list
// Called by the GMUI instance in the form or otherwise

var _navdir, _back, _forward, _backalt, _forwardalt, _allowtab, _set;
_navdir = minmax(argument0,0,2); // 3 and 2 count as the same
_back = argument1;
_forward = argument2;
_backalt = argument3;
_forwardalt = argument4;
_allowtab = argument5;

if (global.GMUIii > 0)
    _set = id;
else
    _set = global;

(_set).GMUIEnableTabbing = true;
(_set).GMUI_navigateDirection = _navdir;
(_set).GMUI_backKey = _back;
(_set).GMUI_forwardKey = _forward;
(_set).GMUI_backAltKey = _backalt;
(_set).GMUI_forwardAltKey = _forwardalt;
(_set).GMUI_enableTab = _allowtab;

