///GMUI_ItemListSettings(Item height, Border color [or -1], Custom Draw Script [or -1], Fade time [frames])

if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowErrorDetailed("Invalid control", GMUI_ItemListSettings);
    return false;
}

if (argument0 > 0)
    ItemListHeight = argument0;
else
    ItemListHeight = GMUIP.cellsize_h;
    

if (is_real(argument1)) {
    if (argument1 > -1)
        ItemListBorderColor[0] = argument1;
}

if (script_exists(argument2))
    ItemListDrawScript = argument2;

if (is_real(argument3)) {
    if (argument3 > 0)
        ItemListFadeTime = argument3;
}
    
// Calculate the middle and quarter height to reuse for drawing
ItemListMidHeight = ItemListHeight / 2;
ItemListThirdHeight = floor(ItemListHeight / 3);

