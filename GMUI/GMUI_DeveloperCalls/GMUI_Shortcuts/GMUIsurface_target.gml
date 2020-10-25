function GMUIsurface_target(argument0, argument1, argument2) {
///(surface, width if created/modified, height if created/modified)
///Sets the target to the surface or creates it if it doesn't exist


var _Surface;

if (surface_exists(argument0)) {
    surface_set_target(argument0);
    _Surface = argument0;
}
else if (argument1 > -1 || argument2 > -1) {
    _Surface = surface_create(argument1,argument2);
    surface_set_target(_Surface);
}
else
    _Surface = -1;

if (_Surface > 0) {
    global.GMUISurfaceTarget = _Surface;
}


return _Surface;
}

