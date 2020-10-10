///GMUI_ControlIsInLayer(control, layer)
function GMUI_ControlIsInLayer(argument0,argument1) {
var _ctl,_L;

_ctl = argument0;
_L = argument1;

if ((_ctl).Layer == _L)
    return true;
    
// Check if it has been added to another layer (nested if's for small GML performance improvement)
if ((_ctl).AdditionalLayer != -1) {
    if ((_ctl).AdditionalLayer > (_ctl).Layer) {
        if (_L <= (_ctl).AdditionalLayer) {
            if (_L > (_ctl).Layer)
                return true;
        }
    }
    else if (_L >= (_ctl).AdditionalLayer) {
        if (_L < (_ctl).Layer)
            return true;
    }
}
    
return false;
}

