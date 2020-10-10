///GMUI_CreateGroup(group number, cell# x, cell# y, cells wide, cells high, Anchor)
///Adds a group to the current GMUI layer that controls can be put into
function GMUI_CreateGroupargument0,argument1,argument2,argument3) {
return GMUI_CreateGroupInLayer((GMUII()).UIAddToLayer,argument0,argument1,argument2,argument3);
}

