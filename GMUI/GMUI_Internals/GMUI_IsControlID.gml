///GMUI_IsControlID(id)
/// Checks that the object ID provided is a control
function GMUI_IsControlID(argument0) {

return (ds_list_find_index((GMUII()).GMUI_controlList,argument0) != -1);
}

