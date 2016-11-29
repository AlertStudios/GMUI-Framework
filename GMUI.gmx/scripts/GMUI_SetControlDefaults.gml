///GMUI_SetControlDefaults() Sets the default values for all controls if they are not specified in GMUI_Form

// ! NOTE ! These values must pass validation or else errors will occur!

// Set the default control styling (Background Color, Border color, Hover color, hover border/rect, hover alpha,
// overwrite color, overwrite alpha, select color, select alpha, 
// showcursor)
GMUI_ControlSetStyle(
    rgb(250,250,255),hsv(135,30,100),rgb(20,160,230),true,0.5,
    rgb(40,40,40),0.1,rgb(240,140,40),0.3,
    true
    );

// Default font style (font, font color, font align)
GMUI_ControlSetFontStyle(fontNumeric,rgb(42,42,42), fa_left);

// Set the default control attributes(id, Max string length/Whole number padding(KEEP @ 0!), max decimal (if applicable), Min value, Max value)
GMUI_ControlSetAttributes(0,0,0,999);



// Specific control initializations //

// Picker controls ( region width, region height, 
// direction type (see below), right/up sprite, left/down sprite )
GMUI_ControlSetPicker(
    sprite_get_width(GMUIspr_arrow) + 4,sprite_get_height(GMUIspr_arrow) + 4,
    global.GMUIDirectionTypeSideVertical,GMUIspr_arrowup,GMUIspr_arrow
    );
// Direction types: global.GMUIDirectionTypeHorizontal: 0, global.GMUIDirectionTypeVertical: 1, global.GMUIDirectionTypeSideVertical: 2


// Text Button control (Text or "", graphic in button or -1, button image sprite or -1, text alignment, hover color or -1)
GMUI_ControlSetButton("Button", -1, -1, -1, -1);
    
