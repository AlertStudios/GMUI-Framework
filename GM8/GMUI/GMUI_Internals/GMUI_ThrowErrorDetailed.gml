#define GMUI_ThrowErrorDetailed
///GMUI_ThrowErrorDetailed(Error Message,script name)
///Throw script name and object caller name with the message

GMUI_ThrowError(string(argument0) + " | " + string(argument1) + " | " + string(object_get_name(object_index)));

