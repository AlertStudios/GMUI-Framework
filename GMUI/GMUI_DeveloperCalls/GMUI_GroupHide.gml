///GMUI_GroupHide(group number, layer number, Hide(1) or show(0))
/// Hide all of the controls within the specified group
function GMUI_GroupHide(argument0,argument1,argument2) {
var _Group, _Layer, _Hide, i, ctrl;
_Group = argument0;
_Layer = argument1;
_Hide = argument2;

if (!(GMUII()).UIInterfaceSet) {
    if ((GMUII()).GMUI_groupSettingsMap[_Layer,_Group] == -1) {
        (GMUII()).GMUI_groupSettingsMap[_Layer,_Group] = ds_map_create();
    }
    
    ds_map_add((GMUII()).GMUI_groupSettingsMap[_Layer,_Group], "Hide", _Hide);
    return true;
}

(GMUII()).GMUI_groupNeedsDrawUpdate[_Layer,_Group] = true;

// Change the value for each of the controls within the group
for(i=0;i<ds_list_size((GMUII()).GMUI_groupControlList[_Layer,_Group]);i+=1) {
    // Get the control id
    ctrl = ds_list_find_value((GMUII()).GMUI_groupControlList[_Layer,_Group],i);
    
    if (!instance_exists(ctrl))
    {
        GMUI_ThrowErrorDetailed("Control no longer exists layer, group: (" + string(_Layer) + "," + string(_Group) + ")",GMUI_GroupHide);
    }
    else {
        GMUI_ControlHide(ctrl,_Hide);
        ctrl.GroupHidden = _Hide;
        
        if ((GMUII()).UIEnableSurfaces) {
            if (ctrl.FadeOnHide && (GMUII()).GMUI_gridMasterControl[_Layer] == -1  && (GMUII()).GMUI_groupMasterControl[_Layer,_Group] == (ctrl)) {
                (GMUII()).GMUI_gridMasterControl[_Layer] = ctrl;
            }
            else
                ctrl.NeedsDrawUpdate = !_Hide;
                ctrl.NeedsGroupUpdate = !_Hide;
        }
    }
}

return true;
}

