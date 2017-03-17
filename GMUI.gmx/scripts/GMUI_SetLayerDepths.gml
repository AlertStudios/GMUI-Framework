///GMUI_SetLayerDepths() Creates a set of layers with their relative depth values from the GMUI default
// This is called by the Create script

layerDepth = depth;

// Each of the control layers are relative to this value, lowest layer on the bottom:
layerDepth_layers = layerDepth-1;

// If you really need more than 100 layers, you can change this (each layer may have tooltips or other objects):
layerDepth_maxLayers = 100;

// Display messages over all control layers
layerDepth_messages = layerDepth_layers - (layerDepth_maxLayers*3);

// Menus show over basic messages and windows
layerDepth_menus = layerDepth_messages - 100;

// Pop-ups show over menus, windows, and messages (each menu may have tooltips or other objects)
layerDepth_popups = layerDepth_menus - (100*3) - 1;

// Warnings are for anything from menus to popups
layerDepth_warnings = layerDepth_popups - 100;

