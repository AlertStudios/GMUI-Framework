///GMUI_SetNavigation(use keyboard[bool], use gamepad[bool], autoswitch [bool], nav direction [GMUIDirection])
///
///

function GMUI_SetNavigation(argument0,argument1,argument2,argument3) {

var _set;

if (global.GMUIii > 0)
    _set = id;
else
    _set = global;
    
if (argument0 > 0)
    (_set).GMUIEnableMouseNav = true;
else
    (_set).GMUIEnableMouseNav = false;
    
if (argument1 > 0)
    (_set).GMUIEnableControllerNav = true;
else
    (_set).GMUIEnableControllerNav = false;
    
if (argument2 > 0)
    (_set).GMUIEnableAutoControllerSwitch = true;
else
    (_set).GMUIEnableAutoControllerSwitch = false;
    
if (argument3 > global.GMUIDirectionTypeBoth)
    (_set).GMUI_navigateDirection = global.GMUIDirectionTypeBoth;
else if (argument3 < global.GMUIDirectionTypeNone)
    (_set).GMUI_navigateDirection = global.GMUIDirectionTypeNone;
else
    (_set).GMUI_navigateDirection = argument3;



}

