///GMUIself()
///Returns id of the GMUI object instance or -1 if not
// Usage: with (GMUIself()) { do something; }
// Alternate Usage: if (GMUIself()) { call GMUI commands; }
function GMUIself() {

var _gmuii,_G;
_gmuii = -1;

for (_G=1;_G<=global.GMUIii;_G+=1) {
    if (id = global.GMUIi_id[_G]) {
        _gmuii = _G;
        break;
    }
}

if (_gmuii > -1) {
    // Change current GMUI to this one:
    global.GMUIi_id[0] = id;
    return global.GMUIi_id[0];
}

return -1;
}

