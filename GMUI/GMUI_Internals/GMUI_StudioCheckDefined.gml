///GMUI_StudioCheckDefined(value) Returns if the argument is defined or not (GM:Studio)
function GMUI_StudioCheckDefined(argument0) {

var a0; a0 = argument0;

//GM8:
if (global.GMUIGameMaker8)
    return true;

//Studio: UNCOMMENT THE NEXT LINE IN GM:STUDIO
return !is_undefined(a0);

}

