/// Hide all of the controls within the specified group
//GMUI_GroupHide(group number, layer number, Hide(1) or show(0))

var _Group, _Layer, _Hide, i, ctrl;
_Group = argument0;
_Layer = argument1;
_Hide = argument2;

// Change the value for each of the controls within the group
for(i=0;i<ds_list_size((GMUII()).GMUI_groupControlList[_Layer,_Group]);i+=1) {
    // Get the control id
    ctrl = ds_list_find_value((GMUII()).GMUI_groupControlList[_Layer,_Group],i);
    
    if (!instance_exists(ctrl))
    {
        GMUI_ThrowError("Control no longer exists. GMUI_GroupHide(" + _Layer + "," + _Group + ")");
    }
    else {
        (ctrl).Hidden = _Hide;
    }
}
