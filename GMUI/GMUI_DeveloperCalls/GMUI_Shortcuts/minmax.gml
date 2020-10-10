///minmax(original value, minimum value, maximum value) Shortcut to keep the value within the min & max range given
function minmax(argument0,argument1,argument2) {
if (is_real(argument0))
    return min(max(argument0,argument1),argument2);
else
    return argument1;
}

