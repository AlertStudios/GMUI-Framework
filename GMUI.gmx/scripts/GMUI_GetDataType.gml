///GMUI_GetDataType("Control Type")
///Takes the control type and returns the data type it is
// Datatypes are defined in GMUI_Init()

var _controlType;
    _controlType = string_lower(string_replace(string(argument0)," ",""));
    
switch (_controlType) {
    case "spritepicker":
    case "textint":
    case "intpicker":
    case "image":
        return global.GMUIDataTypeInteger;
        break;
    case "textdecimal":
    case "doublepicker":
        return global.GMUIDataTypeDecimal;
        break;
    case "textstring":
    case "label":
        return global.GMUIDataTypeString;
        break;
    case "button":
    case "textbutton":
        return global.GMUIDataTypeButton;
        break;
    case "tooltip":
        return global.GMUIDataTypeInfo;
        break;
    case "toggle":
    case "checkbox":
        return global.GMUIDataTypeBoolean;
        break;
    default:
        return -1;
        break;
}
