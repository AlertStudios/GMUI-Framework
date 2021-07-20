///GMUI_SetGhosting(steps)
///default: 1

function GMUI_SetGhosting(argument0) {

if (is_real(argument0))
    GMUIRedrawSteps = max(1,ceil(argument0));
}

