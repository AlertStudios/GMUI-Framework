#define GMUI_Create
///GMUI_Create(GMUI-compatible Object, Interface Script, cell size width [0: default], cell size height [0: default])

// Must be an object
if (!object_exists(argument0)) {
    GMUI_ThrowErrorDetailed("Object provided doesn't exist", GMUI_Create);
    return -1;
}

// Initialize
with (instance_create(0,0,argument0)) {
    return GMUI_CreateEvent(argument1, argument2, argument3);
}

