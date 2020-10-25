///GMUI_GroupExists(Layer Number, Group Number)
///Checks that the group number given exists in the layer in GMUI
function GMUI_GroupExists(argument0,argument1) {

if (!is_real(argument0))
    return false;
    
if (!is_real(argument0))
    return false;

var L,G;
L = floor(argument0);
G = floor(argument1);

return (ds_list_find_index((GMUII()).GMUI_groupList[L],G) != -1);
}

