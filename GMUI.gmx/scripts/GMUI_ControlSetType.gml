///GMUI_ControlSetType(Control, "Control Type")
///Set the type variables based on the control the developer wants to make

var IID,            _type,           _getType;
    IID=argument0;  _type=argument1; _getType=0;

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
        (IID).ControlPicker = true;
        
    case "textint":
    case "textdecimal":
    case "textstring":
        (IID).ControlInput = true;
        
        break;
    case "button":
    case "textbutton":
        (IID).ControlSelectable = false;
        break;
    case "slider":
        (IID).sliderInitialized = false;
        (IID).sliderComputed = false;
        (IID).ControlShowValue = false;
        break;
    case "toggle":
    case "checkbox":
        (IID).toggleInitialized = false;
        (IID).ControlSelectable = false;
        break;
    case "sprite":
        _type = "image";
    case "image":
        (IID).ControlInput = false;
        (IID).ControlSelectable = false;
        break;
    case "dropdown":
        
        break;
    case "label":
    case "tooltip":
        (IID).ControlInteraction = false;
        break;
    default:
        // no match; override to show invalid:
        _type = "invalid";
        
        break;
}

(IID).ControlType = _type;


// Set the data type
_getType = GMUI_GetDataType(_type);
(IID).ControlDataType = _getType;

if (_getType == global.GMUIDataTypeInteger || _getType == global.GMUIDataTypeDecimal || _getType == global.GMUIDataTypeBoolean) {
    (IID).ControlIsNumeric = true;
    (IID).ControlIsString = false;
}
else if (_getType == global.GMUIDataTypeString) {
    (IID).ControlIsString = true;
    (IID).ControlIsNumeric = false;
}

// Return sanitized and processed type back
return _type;


