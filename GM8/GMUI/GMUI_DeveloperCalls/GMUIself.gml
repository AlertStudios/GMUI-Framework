#define GMUIself
///GMUIself()
///Returns id of the GMUI object instance or -1 if not
// Usage: with (GMUIself()) { do something; }
// Alternate Usage: if (GMUIself()) { call GMUI commands; }

var _gmuii,_G;
_gmuii = -1;

for (_G=1;_G<=global.GMUIii;_G+=1) {
    if (id = global.GMUIiid[_G]) {
        _gmuii = _G;
        break;
    }
}

if (_gmuii > -1) {
    // Change current GMUI to this one:
    global.GMUIiid[0] = id;
    return global.GMUIiid[0];
}

return -1;

