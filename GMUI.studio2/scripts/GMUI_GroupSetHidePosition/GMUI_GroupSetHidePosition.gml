///GMUI_GroupSetHidePosition(Group Number, Cell X, Cell Y, Transition_script [or -1], speed in steps)
// Set a group position to transition from and to when showing or hiding group

//todo: get master control and set coordinates to it
var _GMUI, _LayerNumber, _GroupNumber, _MasterControl;
_GMUI = GMUII();
_Layer = UIAddToLayer;
_Group = argument0;


// Map values if interface is not done being created
if (!(_GMUI).UIInterfaceSet) {
    if ((_GMUI).GMUI_groupSettingsMap[_Layer,_Group] == -1) {
        (_GMUI).GMUI_groupSettingsMap[_Layer,_Group] = ds_map_create();
    }
    
    ds_map_add((_GMUI).GMUI_groupSettingsMap[_Layer,_Group], "HideCellX", argument1);
    ds_map_add((_GMUI).GMUI_groupSettingsMap[_Layer,_Group], "HideCellY", argument2);
    ds_map_add((_GMUI).GMUI_groupSettingsMap[_Layer,_Group], "HideTransition", argument3);
    ds_map_add((_GMUI).GMUI_groupSettingsMap[_Layer,_Group], "HideSpeed", argument4);

    return true;
}



if ((_GMUI).GMUI_groupMasterControl[_Layer,_Group] == -1) {
    GMUI_ThrowErrorDetailed("No controls to assign position", GMUI_GroupSetHidePosition);
    return false;
}
else {
    // convert from cell to actual, and call new script to call gmui group transition to cell actual
    _MasterControl = (_GMUI).GMUI_groupMasterControl[_Layer,_Group];
    
    (_MasterControl).T_px_group = GMUI_groupActualX[_Layer,_Group];
    (_MasterControl).T_py_group = GMUI_groupActualY[_Layer,_Group];
    
    (_MasterControl).T_hx_group = GMUI_CellGetActualX(GMUI_GetAnchoredCellX(GMUI_GridGetWidth(GMUII(),_Layer),argument1,(_GMUI).GMUI_groupAnchor[_Layer,_Group]));
    (_MasterControl).T_hy_group = GMUI_CellGetActualY(GMUI_GetAnchoredCellY(GMUI_GridGetHeight(GMUII(),_Layer),argument2,(_GMUI).GMUI_groupAnchor[_Layer,_Group]));
    
    // If group is currently hidden, start at the hide position
    if ((_MasterControl).GroupHidden) {
        (_GMUI).GMUI_groupActualX[_Layer,_Group] = (_MasterControl).T_hx_group;
        (_GMUI).GMUI_groupActualY[_Layer,_Group] = (_MasterControl).T_hy_group;
        with (_MasterControl) {
            T_hrelx_group = T_hx_group - T_px_group;
            T_hrely_group = T_hy_group - T_py_group;
        }
        
        // Bump all controls to their own hidden positions
        for(i=0;i<ds_list_size((_GMUI).GMUI_groupControlList[_Layer,_Group]);i+=1) {
        
            ctrl = ds_list_find_value((_GMUI).GMUI_groupControlList[_Layer,_Group],i);
    
            if (instance_exists(ctrl))
            {
                (ctrl).ActualX += (_MasterControl).T_hrelx_group;
                (ctrl).ActualY += (_MasterControl).T_hrely_group;
            }
        }
        
    }
    
    (_MasterControl).T_hscript_group = argument3;
    (_MasterControl).T_hspeed_group = argument4;
    return true;
}


