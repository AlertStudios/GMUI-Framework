///GMUI_ControlSetSliderMovement(Movement script for slider)
///Set the script called when smoothly moving the slider
function GMUI_ControlSetSliderMovement(argument0) {
if (script_exists(argument0))
    SliderMovementScript = argument0;
}

