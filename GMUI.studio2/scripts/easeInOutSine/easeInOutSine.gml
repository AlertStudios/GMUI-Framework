///easeInOutSine(t,b,c,d) where t is current time, b is start value, c is change in value, and d is duration
///Sinusoidal Ease for moving controls smoothly
function easeInOutSine(argument0,argument1,argument2,argument3) {

var _t,_b,_c,_d;

_t = argument0;
_b = argument1;
_c = argument2;
_d = argument3;


return (-_c)/2 * (cos(pi*_t/_d) - 1) + _b;

//To see copyright notice for this script please click on the following text then press F12:
//ease_CopyrightNotice
}

