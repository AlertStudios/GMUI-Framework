///GMUI_LayerHide(layer number, Hide(1) or show(0))
/// Hide all of the controls within the specified layer

var _Layer, _Hide, i, j, ctrl, _GMUI;
_GMUI = GMUII();
_Layer = argument0;
_Hide = argument1;


// Get grid dimensions
var ctrl;
for(i=0;i<ds_list_size((_GMUI).GMUI_controlList);i+=1) {
    // Get control value
    ctrl = ds_list_find_value((_GMUI).GMUI_controlList,i);
    
    if (!instance_exists(ctrl)) {
        GMUI_ThrowError("Control no longer exists. GMUI_GridAdjustLayer()");
    }
    else if (((ctrl).Layer == _Layer) && ctrl.Group == 0) {
        ctrl.Hidden = _Hide;
        ctrl.NeedsDrawUpdate = true;
    }
}


var _Group;
for(i=0;i<ds_list_size((_GMUI).GMUI_groupList[_Layer]);i+=1) {
    _Group = ds_list_find_value((_GMUI).GMUI_groupList[_Layer],i);
    
    if (GMUI_StudioCheckDefined(_Group)) {
        (GMUII()).GMUI_groupNeedsDrawUpdate[_Layer,_Group] = true;
        
        // Change the value for each of the controls within the group
        for(j=0;j<ds_list_size((GMUII()).GMUI_groupControlList[_Layer,_Group]);j+=1) {
            // Get the control id
            ctrl = ds_list_find_value((GMUII()).GMUI_groupControlList[_Layer,_Group],j);
            
            if (!instance_exists(ctrl))
            {
                GMUI_ThrowErrorDetailed("Control no longer exists layer, group: (" + string(_Layer) + "," + string(_Group) + ")",GMUI_LayerHide);
            }
            else {
                ctrl.Hidden = _Hide;
                ctrl.GroupHidden = _Hide;
            }
        }
    }
}

GMUI_GridUpdateLayer(_GMUI,_Layer);

