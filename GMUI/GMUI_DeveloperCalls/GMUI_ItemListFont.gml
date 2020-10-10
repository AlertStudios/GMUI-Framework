///GMUI_ItemListFont(Font, Font Color, Font Color Hover, Font Alpha, Font Alpha Hover)
function GMUI_ItemListFont(argument0,argument1,argument2,argument3,argument4) {

if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowErrorDetailed("Invalid control", GMUI_ItemListFont);
    return false;
}

if (!ControlItemList) {
    GMUI_ThrowErrorDetailed("'" + valueName + "' is not an item list control", GMUI_ItemListFont);
    return false;
}

// Set 0 index to value, as it keeps the default values
if (font_exists(argument0))
    ItemListFont[0] = argument0;

if (argument1 > -1)
    ItemListFontColor[0] = argument1;
    
if (argument2 > -1)
    ItemListFontColorHover[0] = argument2;

if (argument3 > -1)
    ItemListFontAlpha = argument3;
    
if (argument4 > -1)
    ItemListFontAlphaHover = argument4;
}

