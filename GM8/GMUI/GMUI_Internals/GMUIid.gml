#define GMUIid
/// Returns the GMUI object instance with the given GMUI number
// GMUIid(number)
// Usage: with (GMUIid(1)) { do something; }
// Alternate Usage: if (GMUIid(1)) { call GMUI commands; }

if (!is_real(argument0))
    return - 1;

if (argument0 > 0 && argument0 <= global.GMUIii) {
    if (instance_exists(global.GMUIiid[argument0])) {
        // Change current GMUI to this one:
        global.GMUIiid[0] = global.GMUIiid[argument0];
        return global.GMUIiid[argument0];
    }
}

return -1;

