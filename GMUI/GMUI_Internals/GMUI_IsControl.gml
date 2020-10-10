///GMUI_IsControl()
/// Checks that the object calling script is a control in GMUI
function GMUI_IsControl() {

// Call the actual check with the current object's ID
return GMUI_IsControlID(id);
}

