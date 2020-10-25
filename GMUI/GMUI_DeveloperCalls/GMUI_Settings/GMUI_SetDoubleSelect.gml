///GMUI_SetDoubleSelect(boolean)
///Set double select functionality to on(true) or off(false)
// If double selected, the control will overwrite the contents
function GMUI_SetDoubleSelect(argument0) {

var _opt;
_opt = argument0;

if (!is_real(_opt))
    _opt = true;

if (global.GMUIii > 0)
    GMUIAllowDoubleSelect = _opt;
else
    global.GMUIAllowDoubleSelect = _opt;
    
}

