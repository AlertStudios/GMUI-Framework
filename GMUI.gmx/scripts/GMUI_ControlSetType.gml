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
    case "-1": _type = "intpicker"; break;
    case "-2": _type = "doublepicker"; break;
    case "-3": _type = "spritepicker"; break;
    case "-4": _type = "textint"; break;
    case "-5": _type = "textdecimal"; break;
    case "-6": _type = "textstring"; break;
    case "-7": _type = "button"; break;
    case "-8": _type = "textbutton"; break;
    case "-9": _type = "slider"; break;
    case "-10": _type = "toggle"; break;
    case "-11": _type = "checkbox"; break;
    case "-12": _type = "image"; break;
    case "-13": _type = "image"; break;
    case "-14": _type = "dropdown"; break;
    case "-15": _type = "selectlist"; break;
    case "-16": _type = "label"; break;
    case "-17": _type = "tooltip"; break;
}
switch (_type) {
    case "spritepicker":
    
        IID.ControlPicker = true;
        IID.optionsInitialized = false;
        break;
    case "intpicker":
    case "doublepicker":
        IID.ControlPicker = true;
    
    case "textint":
    case "textdecimal":
    case "textstring":

        IID.ControlInput = true;
        break;
    case "button":
    case "textbutton":
    
        IID.ControlSelectable = false;
        break;
    case "slider":
    
        IID.sliderInitialized = false;
        IID.sliderComputed = false;
        IID.ControlShowValue = false;
        break;
    case "toggle":
    case "checkbox":
    
        IID.toggleInitialized = false;
        IID.ControlSelectable = false;
        break;
    case "sprite":
    case "image":
    
        IID.ControlInput = false;
        IID.ControlSelectable = false;
        break;
    case "selectlist":
    case "dropdown":
        
        IID.ControlItemList = true;
        GMUI_ControlSetDefaultItemList(IID);
        with (IID) { GMUI_ControlSetScrollbarDefaults(true); }
        
        if (_type == "dropdown") {
            GMUI_ControlSetDefaultDropdown(IID);
        
            IID.ControlHasScrollbar = false;
            IID.ControlItemList = false;
            IID.ControlInput = false;
            IID.ControlSelectable = false;
            
        }
        break;
    case "scrollbarhandler":
    case "tooltip":
    
        IID.ControlInteraction = false;
    case "label": // (Label includes interaction)
    
        IID.ControlInput = false;
        IID.ControlStyleDefined = false;
        IID.ControlSelectable = false;
        break;
    default:
        // no match; override to show invalid:
        _type = "invalid";
        
        break;
}

IID.ControlType = _type;

// Set the data type
_getType = GMUI_GetDataType(_type);
IID.ControlDataType = _getType;

if (_getType == global.GMUIDataTypeInteger || _getType == global.GMUIDataTypeDecimal || _getType == global.GMUIDataTypeBoolean) {
    IID.ControlIsNumeric = true;
    IID.ControlIsString = false;
}
else if (_getType == global.GMUIDataTypeString) {
    IID.ControlIsString = true;
    IID.ControlIsNumeric = false;
}

// Return sanitized and processed type back
return _type;


