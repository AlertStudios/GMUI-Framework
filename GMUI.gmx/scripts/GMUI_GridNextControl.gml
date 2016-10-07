///GMUI_GridNextControl()
///Changes the selected control to the next control in the list by ID

// Select the first control if none are selected, otherwise pull the next ID
var ctrlIndex,ctrl;
if ((GMUII()).SelectedControl != -1)
{
    ctrlIndex = ds_list_find_index((GMUII()).GMUI_controlList,(GMUII()).SelectedControl);
    if (ctrlIndex < 0)
        ctrlIndex = -1;
}
else
    ctrlIndex = -1;

GMUI_ResetControlStatus("Selected");

ctrl = ds_list_find_value((GMUII()).GMUI_controlList,ctrlIndex + 1);
if (ctrl > 0 && instance_exists(ctrl))
{
    if ((!ctrl.Disabled) && (!ctrl.NonClickable) && (!ctrl.Hidden))
    {
        GMUI_GridSelect(ctrl);
        return true;
    }
}


return false;
