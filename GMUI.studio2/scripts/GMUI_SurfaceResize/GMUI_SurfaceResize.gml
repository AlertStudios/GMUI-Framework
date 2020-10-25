///GMUI_SurfaceResize(GMUI instance, Surface target, Width, Height)
///Resizes the surface only after the UI is set. Return is only for reference if needed.
function GMUI_SurfaceResize(argument0,argument1,argument2,argument3) {
var _Surface;

if ((argument0).UIInterfaceSet) {
    if (surface_exists(argument1)) {
        
        _Surface = surface_create(argument2,argument3);
        surface_copy(_Surface,0,0,argument1);
        
        surface_free(argument1);
        
        return _Surface;
    }
}
    
return -1;
}

