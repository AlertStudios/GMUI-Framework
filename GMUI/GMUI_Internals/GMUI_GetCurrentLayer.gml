///GMUI_GetCurrentLayer()
///Returns the layer number currently viewed for the current GMUI instance
function GMUI_GetCurrentLayer() {
if (GMUII().UIInterfaceSet)
    return (GMUII()).UILayer;
else
    return (GMUII()).UIAddToLayer;
}

