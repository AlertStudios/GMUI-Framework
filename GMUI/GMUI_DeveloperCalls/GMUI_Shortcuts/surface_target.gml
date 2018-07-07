///surface_target(surface, width if created, height if created)
///Sets the target to the surface or creates it if it doesn't exist

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

