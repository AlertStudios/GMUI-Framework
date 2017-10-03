///easeInOutBack(t,b,c,d) where t is current time, b is start value, c is change in value, and d is duration
///Smooth overshot Ease for moving controls smoothly

var _t,_tt,_b,_c,_d, _p;
_t = argument0;
_b = argument1;
_c = argument2;
_d = argument3;

_s = 1.70158 * 1.525;
_t = _t/(_d/2);

if (_t < 1)
    return _c/2*((_t)*_t*((_s+1)*_t - _s)) + _b;

_t -= 2;
return _c/2*(_t*_t*((_s+1)*_t + _s) + 2) + _b;

//To see copyright notice for this script please click on the following text then press F12:
//ease_CopyrightNotice

