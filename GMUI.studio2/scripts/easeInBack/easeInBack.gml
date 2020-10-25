///easeInBack(t,b,c,d) where t is current time, b is start value, c is change in value, and d is duration
///Smooth overshot Ease for moving controls smoothly
function easeInBack(argument0,argument1,argument2,argument3) {

var _t,_b,_c,_d, _p,_s;
_t = argument0;
_b = argument1;
_c = argument2;
_d = argument3;

_s = 1.70158;
_t = _t/_d;

return _c*(_t)*_t*((_s+1)*_t - _s) + _b;

//To see copyright notice for this script please click on the following text then press F12:
//ease_CopyrightNotice
}

