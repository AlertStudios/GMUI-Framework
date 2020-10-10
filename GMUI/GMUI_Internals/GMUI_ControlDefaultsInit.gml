///GMUI_ControlDefaultsInit() Sets the GMUI default values for all controls if they are not specified in GMUI_Form
function GMUI_ControlDefaultsInit() {

// ! NOTE ! These values are the defaults provided by the framework
// If you want to change default values, use: GMUI_SetControlDefaults()

// Set the default control styling
GMUI_ControlSetStyle(
    rgb(250,250,255),hsv(135,30,100),rgb(20,160,230),true,0.5,
    rgb(40,40,40),0.1,rgb(240,140,40),0.3,
    true
    );
    
// Default sprite options
GMUI_ControlSetSpriteExt(-1,0,0,0,1,1,c_white,1);
GMUI_ControlSetSpriteMap(-1,-1,-1,-1,-1,-1,-1,-1,-1,false);

// Default font style (font, font color, font align)
GMUI_ControlSetFontStyle(noone,rgb(42,42,42), fa_left);

// Set the default control attributes
GMUI_ControlSetAttributes(0,0,0,999);

// Default group style can be set when called
ControlHasGroupStyle = false;

// Specific control initializations //

// Picker controls ( region width, region height, 
// direction type (see below), right/up sprite, left/down sprite )
GMUI_ControlSetPicker(
    //sprite_get_width(GMUIspr_arrow) + 4,sprite_get_height(GMUIspr_arrow) + 4,
    cellsize * 2 + 4, cellsize_h + 4,
    global.GMUIDirectionTypeSideVertical,noone,noone,//GMUIspr_arrowup,GMUIspr_arrow
    );


// Text Button control (Text or "", graphic in button, button image sprite, text alignment, hover color)
GMUI_ControlSetButton("", -1, -1, -1);
}

