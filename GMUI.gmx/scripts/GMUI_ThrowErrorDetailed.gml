///GMUI_ThrowErrorDetailed(Error Message,script)
///Throw script name and object caller name with the message

GMUI_ThrowError(string(argument0) + " | " + string(script_get_name(argument1)) + " | " + string(object_get_name(object_index)));
