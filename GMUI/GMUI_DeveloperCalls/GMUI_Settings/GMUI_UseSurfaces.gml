///GMUI_UseSurfaces(boolean)
///Enable the use of surfaces for controls and drawing

var _opt, _set;
_opt = argument0;

if (!is_real(_opt))
    _opt = true;

if (global.GMUIii > 0)
    _set = id;
else
    _set = global;

(_set).UIEnableSurfaces = _opt;

