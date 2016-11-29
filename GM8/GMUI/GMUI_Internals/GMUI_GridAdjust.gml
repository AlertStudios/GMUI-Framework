#define GMUI_GridAdjust
///GMUI_GridAdjust(cells wide , cells high)
/// Adjusts grid for all layers of the GMUI instance

var layer;
for(i=0;i<ds_list_size((GMUII()).GMUI_gridlist);i+=1) {

    layer = ds_list_find_value((GMUII()).GMUI_gridlist,i);
    
    if (layer >= 0) {
        GMUI_GridAdjustLayer(layer,argument0,argument1);
    }
}

