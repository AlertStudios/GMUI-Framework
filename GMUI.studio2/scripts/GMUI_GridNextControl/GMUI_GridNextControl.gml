///GMUI_GridNextControl(next control /or previous: false)
///Changes the selected control to the next control in the list by ID

// Select the first control if none are selected, otherwise pull the next ID
var ctrlIndex,ctrl,i;
if ((GMUII()).SelectedControl != -1) {
    ctrlIndex = ds_list_find_index((GMUII()).GMUI_controlList,(GMUII()).SelectedControl);
    if (ctrlIndex < 0)
        ctrlIndex = 0;
}
else
    ctrlIndex = 0;

GMUI_ResetControlStatus("Selected",GMUII());
if (argument0) {
    if (ctrlIndex == ds_list_size((GMUII()).GMUI_controlList)) {
        ctrlIndex = 0;
    }
    else {
        ctrlIndex += 1;
    }
}
else {
    if (ctrlIndex == 0)
        ctrlIndex = ds_list_size((GMUII()).GMUI_controlList);
    else
        ctrlIndex -= 1;
}

i=0;
while (i < ds_list_size((GMUII()).GMUI_controlList)) {
    ctrl = ds_list_find_value((GMUII()).GMUI_controlList,ctrlIndex);
    if (ctrl > 0 && instance_exists(ctrl)) {
        if ((!ctrl.Disabled) && (!ctrl.NonClickable) && (!ctrl.Hidden)) {
            GMUI_GridSelect(ctrl);
            return true;
        }
    }
    if (argument0) {
        ctrlIndex += 1;
        if (ctrlIndex > ds_list_size((GMUII()).GMUI_controlList)) {
            ctrlIndex = -1;
        }
    }
    else {
        ctrlIndex -= 1;
        if (ctrlIndex < 0) {
            ctrlIndex = ds_list_size((GMUII()).GMUI_controlList);
        }
    }
    i += 1;
}


return false;

