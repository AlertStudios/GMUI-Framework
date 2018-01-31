#define GMUI_CreatePopup
///GMUI_CreatePopup (popup name, cell# x, cell# y, cells wide, cells high, Anchor, global.GMUIPopup...)
///Adds a popup to a GMUI layer that has typical control options for prompt


// Arguments
var _SCRIPT,_CellX,_CellY,_menu,_name;
_SCRIPT = GMUI_CreatePopup;
_CellX = argument1;
_CellY = argument2;
_name = string(argument0);


// Validate
if (!is_real(_CellX) || !is_real(_CellY)) {
    GMUI_ThrowErrorDetailed("Invalid parameters",_SCRIPT);
    return -1;
}

// Call to create a menu that returns the menu number
_menu = GMUI_CreateMenuType(_SCRIPT,_name,_CellX,_CellY,argument3,argument4,argument5);

if (_menu > -1) {
    switch (argument6) {
        case global.GMUIPopupInformation:
            // Button with "Ok"
            with (GMUI_Add("GMUIPopupOkBtn"+string(_menu), "textbutton", 5,3, 4,2, global.GMUIAnchorBottomRight)) {
                GMUI_ControlSetButtonAction(GMUI_DefaultActionOk)
                GMUI_ControlSetButton("Ok",-1,-1,-1);
                GMUI_ControlAddToPopup(_name);
            }
            break;
        case global.GMUIPopupConfirm:
            // Buttons Yes / No
            with (GMUI_Add("GMUIPopupYesBtn"+string(_menu), "textbutton", 10,3, 4,2, global.GMUIAnchorBottomRight)) {
                GMUI_ControlSetButtonAction(GMUI_DefaultActionOk)
                GMUI_ControlSetButton("Yes",-1,-1,-1);
                GMUI_ControlAddToPopup(_name);
            }
            with (GMUI_Add("GMUIPopupNoBtn"+string(_menu), "textbutton", 5,3, 4,2, global.GMUIAnchorBottomRight)) {
                GMUI_ControlSetButtonAction(GMUI_DefaultActionNo)
                GMUI_ControlSetButton("No",-1,-1,-1);
                GMUI_ControlAddToPopup(_name);
            }
            break;
        case global.GMUIPopupThreeOptions:
            // Buttons Yes / No / Cancel
            with (GMUI_Add("GMUIPopupYesBtn"+string(_menu), "textbutton", 15,3, 4,2, global.GMUIAnchorBottomRight)) {
                GMUI_ControlSetButtonAction(GMUI_DefaultActionOk)
                GMUI_ControlSetButton("Yes",-1,-1,-1);
                GMUI_ControlAddToPopup(_name);
            }
            with (GMUI_Add("GMUIPopupNoBtn"+string(_menu), "textbutton", 10,3, 4,2, global.GMUIAnchorBottomRight)) {
                GMUI_ControlSetButtonAction(GMUI_DefaultActionNo)
                GMUI_ControlSetButton("No",-1,-1,-1);
                GMUI_ControlAddToPopup(_name);
            }
            with (GMUI_Add("GMUIPopupCancelBtn"+string(_menu), "textbutton", 5,3, 4,2, global.GMUIAnchorBottomRight)) {
                GMUI_ControlSetButtonAction(GMUI_DefaultActionCancel)
                GMUI_ControlSetButton("Cancel",-1,-1,-1);
                GMUI_ControlAddToPopup(_name);
            }
            break;
    }
    
    return _menu;
}
else {
    GMUI_ThrowErrorDetailed("Unable to create popup "+_name,_SCRIPT);
    return -1;
}


