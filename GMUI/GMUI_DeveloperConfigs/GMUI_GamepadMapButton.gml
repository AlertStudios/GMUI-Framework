///GMUI_GamepadMapButton(gamepad number, key type index, gamepad button)
///Map a key index to a controller button for the indicated gamepad
function GMUI_GamepadMapButton(argument0, argument1, argument2) {

var _controller;

_controller = GMUIminmax(argument0,1,2);

GMUIGamepadButtons[_controller,argument1] = argument2;


}

