///GMUI_SetDoubleSelect(boolean)
///Set double select functionality to on(true) or off(false)
// If double selected, the control will overwrite the contents

var _opt, _set;
_opt = argument0;

if (!is_real(_opt))
    _opt = true;

if (global.GMUIii > 0)
    _set = id;
else
    _set = global;

(_set).GMUIAllowDoubleSelect = _opt;

