/// Selects a control object from the grid (Called by GMUI_GridStep)

// GMUI_GridSelect(control object)


// Set the keyboard string to the value string
(argument0).valuePrevious = (argument0).value;
(argument0).valueStringPrevious = (argument0).valueString;

keyboard_string = (argument0).valueString;

(GMUII()).SelectedControl = argument0;
(argument0).Selected = 1;

// Double selection will overwrite the current value
if ((GMUII()).PreviousSelectedControl == argument0)
{
    if ((GMUII()).GMUIAllowDoubleSelect)
        (argument0).DoubleSelected = 1;   
}
