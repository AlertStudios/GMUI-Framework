///GMUI_SetGamepadDefaults(1 or 2 controllers to set, if available)
///Set the default mapping for gamepad inputs
// Called by the GMUI instance in the form or otherwise
function GMUI_SetGamepadDefaults(argument0) {

var _controllers,_i;
_controllers = floor(GMUIminmax(argument0,1,2));

// Setup controller defaults for GMS and GM8
GMUI_StudioGamepad();

GMUIGamepadMode = false;
GMUIGamepads = _controllers;
GMUIGamepadButtons[0,0] = 0;

for (_i = 1; _i <= _controllers; _i+=1) {

    GMUIGamepadButtons[_i,gmuigp_up] = gmuigp_up;
    GMUIGamepadButtons[_i,gmuigp_right] = gmuigp_right;
    GMUIGamepadButtons[_i,gmuigp_down] = gmuigp_down;
    GMUIGamepadButtons[_i,gmuigp_left] = gmuigp_left;
    GMUIGamepadButtons[_i,gmuigp_accept] = gmuigp_accept;
    GMUIGamepadButtons[_i,gmuigp_cancel] = gmuigp_cancel;
    
}

}

