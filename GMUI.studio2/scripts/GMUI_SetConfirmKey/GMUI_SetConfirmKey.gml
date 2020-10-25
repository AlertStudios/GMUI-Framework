///GMUI_SetConfirmKey(confirmation key: vk_* or vk_nokey to disable)
///Key to automatically submit the form (WIP)
function GMUI_SetConfirmKey(argument0) {

var _key, _set;
_key = argument0;

if (!is_real(_key))
    _key = vk_nokey;

if (global.GMUIii > 0)
    _set = id;
else
    _set = global;

// Key will deselect the control and execute
if (global.GMUIii > 0)
    GMUIConfirmKey = _key;
else
    global.GMUIConfirmKey = _key;
    
}

