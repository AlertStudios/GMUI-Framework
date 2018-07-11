///GMUI_SetDepth(depth of bottom-most layer of instance)
///Key to automatically submit the form (WIP)

var _depth;
_depth = argument0;

if (!is_real(_depth))
    _depth = -9999;

if (global.GMUIii > 0)
    depth = _depth;
else
    global.GMUIDepth = _depth;

