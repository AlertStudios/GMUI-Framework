///GMUI_GridSelect(control object)
/// Selects a control object from the grid (Called by GMUI_GridStep)


// Set the keyboard string to the value string
(argument0).valuePrevious = (argument0).value;
(argument0).valueStringPrevious = (argument0).valueString;

keyboard_string = (argument0).valueString;

(GMUII()).SelectedControl = argument0;
(argument0).Selected = 1;

// Double selection will overwrite the current value
if ((GMUII()).PreviousSelectedControl == argument0) {
    if ((GMUII()).GMUIAllowDoubleSelect) {
        (argument0).DoubleSelected = 1;
    }   
}
else if (GMUI_IsScript((argument0).SelectingActionScript)) {
    // If there is a script to assigned to run it'll only be done once
    script_execute((argument0).SelectingActionScript);
}

