///GMUI_GetDataType("Control Type")
///Takes the control type and returns the data type it is
// Datatypes are defined in GMUI_Init()

var _controlType;
    _controlType = string_lower(string_replace(string(argument0)," ",""));
    
switch (_controlType) {
    case "textint":
    case "intpicker":
        return global.GMUIDataTypeInteger;
        break;
    case "textdecimal":
    case "doublepicker":
        return global.GMUIDataTypeDecimal;
        break;
    case "textstring":
        return global.GMUIDataTypeString;
        break;
    case "button":
    case "textbutton":
        return global.GMUIDataTypeButton;
        break;
}

