///GMUI_ControlSetType("Control Type")
///Set the type variables based on the control the developer wants to make

var IID,            _type,              isinput,    ispicker,   _getType;
    IID=argument0;  _type=argument1;    isinput=0;  ispicker=0; _getType=0;

if (!GMUI_IsControlID(IID) && IID != GMUII()) {
    GMUI_ThrowError("Invalid control for GMUI_ControlSetType");
    return "";
}

// Sanitation of type input from developer
_type = string_lower(string_replace(_type," ",""));


// Set if input, or button, or etc 
switch (_type) {
    case "intpicker":
    case "doublepicker":
        ispicker = 1;
        
    case "textint":
    case "textdecimal":
    case "textstring":
        isinput = 1;
        
        break;
    case "button":
    case "textbutton":
        
        
        break;
    case "slider":
    case "label":
    case "dropdown":
        
        break;
    default:
        // no match; override to show invalid:
        _type = "invalid";
        
        break;
}

(IID).ControlType = _type;
(IID).ControlInput = isinput;
(IID).ControlPicker = ispicker;


// Set the data type
_getType = GMUI_GetDataType(_type);
(IID).ControlDataType = _getType;

if (_getType == global.GMUIDataTypeInteger || _getType == global.GMUIDataTypeDecimal) {
    (IID).ControlIsNumeric = true;
    (IID).ControlIsString = false;
}
else if (_getType == global.GMUIDataTypeString) {
    (IID).ControlIsString = true;
    (IID).ControlIsNumeric = false;
}

// Return sanitized and processed type back
return _type;


