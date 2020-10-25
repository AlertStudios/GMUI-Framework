function GMUIsurface_reset() {
/// If a surface target has been established, reset it

if (global.GMUISurfaceTarget > -1) {

    surface_reset_target();
    global.GMUISurfaceTarget = -1;
    
    return true;
}
else
    global.GMUISurfaceTarget -= 1;

return false;

}

