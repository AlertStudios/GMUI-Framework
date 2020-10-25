///GMUI_Add("Name", "Type String", cell# x, cell# y, cells wide (min 1), cells high (min 1), Anchor)
///Adds a component(instance) to the GMUI grid at the current layer
function GMUI_Add(argument0,argument1,argument2,argument3,argument4,argument5,argument6) {
return GMUI_AddToLayer((GMUII()).UIAddToLayer,argument0,argument1,argument2,argument3,argument4,argument5,argument6);
}

