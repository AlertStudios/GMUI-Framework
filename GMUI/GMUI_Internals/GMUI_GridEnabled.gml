///GMUI_GridEnabled()
/// Returns if the entire grid is enabled to be used

if (InitialDisable > 0)
{
    InitialDisable -= 1;
    return false;
}
else
{
    return true;
}

