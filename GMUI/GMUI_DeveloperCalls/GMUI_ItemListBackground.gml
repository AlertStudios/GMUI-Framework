///GMUI_ItemListBackground(Background Color, Background Color Hover, Background Alpha, Background Alpha Hover)

if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowErrorDetailed("Invalid control", GMUI_ItemListBackground);
    return false;
}

if (!ControlItemList && ControlType != "dropdown") {
    GMUI_ThrowErrorDetailed("'" + valueName + "' is not an item list control", GMUI_ItemListBackground);
    return false;
}

// Set 0 index to value, as it keeps the default values
if (argument0 > -1)
    ItemListBackgroundColor[0] = argument0;
    
if (argument1 > -1)
    ItemListBackgroundColorHover[0] = argument1;

if (argument2 > -1)
    ItemListBackgroundAlpha = argument2;
    
if (argument3 > -1)
    ItemListBackgroundAlphaHover = argument3;



