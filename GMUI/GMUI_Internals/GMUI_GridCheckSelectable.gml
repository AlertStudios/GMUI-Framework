///GMUI_GridCheckSelectable(Control, Direction, Ignore Cell [or -1], Ignore Cell Max [or -1])
///Returns true if the control is selectable and not within the ignore range
function GMUI_GridCheckSelectable(argument0,argument1,argument2,argument3) {

var _ctrl; _ctrl = argument0;

if (_ctrl > -1 && (_ctrl.GMUIP).SelectedControl != _ctrl) {

    if (_ctrl.Disabled || _ctrl.NonClickable || _ctrl.Hidden)
        return false;
        
    else if (argument2 <= -1)
        return true;
        
    else if (argument1 == global.GMUIDirectionTypeHorizontal && 
        (_ctrl.CellX == argument2 || (argument3 >= 0 && _ctrl.CellX > argument2 && _ctrl.CellX <= argument3)))
        return false;
        
    else if (argument1 == global.GMUIDirectionTypeVertical && 
        (_ctrl.CellY == argument2 || (argument3 >= 0 && _ctrl.CellY > argument2 && _ctrl.CellY <= argument3)))
        return false;
        
    else
        return true;

}
else
    return false;

}

