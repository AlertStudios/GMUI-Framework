///GMUI_ControlSetText(string)
///Similar to setting the value for the label, but will adjust the height to fit as well


if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowErrorDetailed("Invalid control", GMUI_ControlSetText);
    return false;
}

var str_h;
str_h = string_height_ext(argument0,-1,CellWide*GMUIP.cellsize-ControlPaddingX*2);

CellHigh = minmax(ceil(str_h/GMUIP.cellsize_h),CellHigh,CellHighMax);

return GMUI_ControlSetInitValue(argument0);


