#define GMUI_Create
///GMUI_Create(GMUI-compatible Object, Interface Script, cell size width [0: default], cell size height [0: default])

// Must be an object
if (!object_exists(argument0))
    return -1;

var _NEWGMUI;
_NEWGMUI = instance_create(0,0,argument0);

// Initialize
with (_NEWGMUI) {
    GMUI_CreateEvent(argument1, argument2, argument3);
}

return _NEWGMUI;

