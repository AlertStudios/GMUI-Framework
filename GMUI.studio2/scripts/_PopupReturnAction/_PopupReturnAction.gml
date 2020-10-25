function _popupReturnAction() {

// Show result
var str;

switch (GMUI_PopupGetResponse()) {
    case -1: str = "Cancel"; break;
    case 0: str = "No"; break;
    case 1: str = "Yes/Ok" break;
    default: str = "No response"; break;
}

with (GMUI_GetControl("ResponseLabel")) {
    GMUI_ControlSetText("Responded with: " + str);
}


}