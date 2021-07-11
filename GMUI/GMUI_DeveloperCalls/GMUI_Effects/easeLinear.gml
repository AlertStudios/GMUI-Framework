///easeLinear(t,b,c,d) where t is current time, b is start value, c is change in value, and d is duration
function easeLinear(argument0,argument1,argument2,argument3) {

var _t,_b,_c,_d;
_t = argument0;
_b = argument1;
_c = argument2;
_d = argument3;

return _b+_c*_t/_d;

