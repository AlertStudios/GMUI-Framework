///GMUI_ItemListSelectAction(Script with argument0 as ID)

if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowErrorDetailed("Invalid control", GMUI_ItemListSelectAction);
    return false;
}

if (!ControlItemList) {
    GMUI_ThrowErrorDetailed("'" + valueName + "' is not an item list control", GMUI_ItemListSelectAction);
    return false;
}

if (script_exists(argument0)) {
    ItemListActionScript = argument0;
    return true;
}

return false;

