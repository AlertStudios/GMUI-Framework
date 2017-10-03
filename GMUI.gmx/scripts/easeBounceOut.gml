///easeBounceOut(t,b,c,d) where t is current time, b is start value, c is change in value, and d is duration
/// Bounce Ease for moving controls smoothly

var t,_b,_c,_d;

_t = argument0;
_b = argument1;
_c = argument2;
_d = argument3;

_t = _t/_d;
if (_t < ( 1 / 2.75 ) )
    return _c * (7.5625 *_t*_t) + _b;
else if (_t < ( 2 / 2.75 ) )
{
    _t -= (1.5/2.75);
    return _c * (7.5625 *_t*_t + .75 ) + _b;
}
else if (_t < ( 2.5 / 2.75 ) )
{
    _t -= (2.25/2.75);
    return _c * (7.5625 *_t*_t + .9375 ) + _b;
}
else
{
    _t -= (2.625/2.75);
    return _c * (7.5625 *_t*_t + .984375 ) + _b;
}

//To see copyright notice for this script please click on the following text then press F12:
//ease_CopyrightNotice
