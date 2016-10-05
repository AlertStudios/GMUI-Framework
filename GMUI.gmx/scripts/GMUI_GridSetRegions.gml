/// Set the control regions for all layers

// Cycle through each grid layer to set region
var i,l;
for(i=0;i<ds_list_size((GMUII()).GMUI_gridlist);i+=1) {
    l = ds_list_find_value((GMUII()).GMUI_gridlist,i);
    GMUI_GridSetRegionsLayer(l);
}
