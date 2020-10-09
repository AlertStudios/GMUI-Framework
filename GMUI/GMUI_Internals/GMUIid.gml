///GMUIid(number)
///Returns the GMUI object instance with the given GMUI number and sets current grid ref to it
// Usage: with (GMUIid(1)) { do something; }
// Alternate Usage: if (GMUIid(1)) { call GMUI commands; }

if (!is_real(argument0))
    return -1;

if (argument0 > 0 && argument0 <= global.GMUIii) {
    if (instance_exists(global.GMUIi_id[argument0])) {
        // Change current GMUI to this one:
        global.GMUIi_id[0] = global.GMUIi_id[argument0];
        return global.GMUIi_id[argument0];
    }
}

return -1;

