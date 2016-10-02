#define GMUI_ControlFilterInput
/// Modifies keyboard string to be acceptable for the control. Typcially called on a keypress.

// GMUI_ControlFilterInput(Control Type, Input String - keyboard_string)
// Returns: new input string

var filter, CT, ks;
CT = argument0;
ks = argument1;

switch (CT)
{
// Numerics
    case "intpicker":
    case "textint":
    case "textdecimal":
        if (CT == "textint" || CT == "intpicker")
        {
            ks = string_copy(string_digits(ks),1,18);
        }
        else if (CT == "textdecimal")
        {
            // Check that the last character entered is valid
            filter = string_copy(ks,string_length(ks),1);
            if (string_digits(filter) == "" && filter != ".")
            {
                if (!(string_length(ks) == 1 && string_copy(ks,1,1) == "-"))
                    ks = string_copy(ks,1,string_length(ks)-1);
            }
             
            ks = string_copy(ks,1,18);
        }
        
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
        break;
    case "textstring": //Text-based
        // Any string limitations can go here.
        // (They will probably be optional, like only allow alphabet or alphanumeric or custom or something...
        
        break;
}

return ks;
                    

