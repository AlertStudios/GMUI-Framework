///GMUI_GridAdjust(cells wide , cells high)
/// Adjusts grid for all layers of the GMUI instance
function GMUI_GridAdjust(argument0,argument1) {

var _layer, i;
for(i=0;i<ds_list_size((GMUII()).GMUI_gridlist);i+=1) {

    _layer = ds_list_find_value((GMUII()).GMUI_gridlist,i);
    
    if (_layer >= 0) {
        GMUI_GridAdjustLayer(_layer,argument0,argument1);
    }
}
}

