///surface_target(surface, width if created/modified, height if created/modified)
///Sets the target to the surface or creates it if it doesn't exist
function surface_target(argument0, argument1, argument2) {

var _Surface;

if (surface_exists(argument0)) {
    surface_set_target(argument0);
    _Surface = argument0;
}
else {
    _Surface = surface_create(argument1,argument2);
    surface_set_target(_Surface);
}


return _Surface;
}

