///GMUI_ControlFilterInput(Control Type, Input String - keyboard_string)
///Modifies keyboard string to be acceptable for the control. Typcially called on a keypress.
// Returns: new input string

var filter, CT, ks, _getDataType, isNumeric;
CT = string_lower(string_replace(string(argument0)," ",""));
ks = argument1;

_getDataType = GMUI_GetDataType(CT);

if (_getDataType == global.GMUIDataTypeInteger || _getDataType == global.GMUIDataTypeDecimal)
    isNumeric = true;
else
    isNumeric = false;

    
// Numerics
if (isNumeric) { 
    // Check that the last character entered is valid
    filter = string_copy(ks,string_length(ks),1);
    if (string_digits(filter) == "" && filter != ".") {
        if (!(string_length(ks) == 1 && string_copy(ks,1,1) == "-"))
            ks = string_copy(ks,1,string_length(ks)-1);
    }
    
    // Limitation of a numeric in GM
    if (string_length(string_digits(ks)) > 17)
        ks = string_copy(ks,1,18-(18 - string_length(string_digits(ks))));
    
    // Only one minus sign and decimal point allowed
    filter = string_copy(ks,string_length(ks),1);
    if (filter == "-" || filter == ".")
    {
        if (string_count("-",ks) > 1 || string_count(".",ks) > 1)
            ks = string_copy(ks,1,string_length(ks)-1);
    }
    else
    {
        // Apply zero's rule
        if (string_copy(ks,1,2) == "00")
            ks = string_copy(ks,2,string_length(ks)-1);
        else if (string_copy(ks,1,1) == "0" && string_length(ks) > 1 && string_copy(ks,2,1) != ".")
            ks = string_copy(ks,2,string_length(ks)-1);
    }
}
else if (_getDataType == global.GMUIDataTypeString) {
    // Any string limitations can go here.
    // (They will probably be optional, like only allow alphabet or alphanumeric or custom or something...
}

return ks;

