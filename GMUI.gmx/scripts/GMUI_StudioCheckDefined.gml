/// Returns if the argument is defined or not (GM:Studio)

var a0; a0 = argument0;

//GM8:
if (global.GMUIGameMaker8)
    return true;

//Studio
return !is_undefined(a0);
