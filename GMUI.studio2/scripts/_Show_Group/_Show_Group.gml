// Uses an argument to determine which group to show


// Hide group shown
var _grouplayer, _i, _group; _grouplayer = 0;
_group = argument0;

// Show group selected
// Right Group 2: Sliders
// Right Group 3: Inputs
// Right Group 4: Toggles
// Right Group 5: Selection
// Right Group 6: Disabling
// Right Group 7: Layering
// Right Group 8: Movement
// Right Group 9: Anchoring
// Right Group 10: Expand (may also be button action?)

for (_i=2; _i <=10; _i+=1) {
    if (_i != _group) {
        GMUI_GroupHide(_i,_grouplayer,true);
    }
}

GMUI_GroupHide(_group,_grouplayer,false);


