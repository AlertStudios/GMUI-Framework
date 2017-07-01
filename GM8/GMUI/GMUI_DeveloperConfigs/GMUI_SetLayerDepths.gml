#define GMUI_SetLayerDepths
///GMUI_SetLayerDepths() Creates a set of layers with their relative depth values from the GMUI default
// This is called by the Create script

layerDepth = depth;

// Each of the control layers are relative to this value, lowest layer on the bottom:
layerDepth_layers = layerDepth-1;

// If you really need more than 100 layers, you can change this (each layer may have tooltips or other objects):
layerDepth_maxLayers = 100;


// Display messages over all control layers (controls may have 3 depths per layer)
layerDepth_messages = layerDepth_layers - (layerDepth_maxLayers*3);

// Menus show over basic messages and windows
layerDepth_menus = layerDepth_messages - 1;

// Pop-ups show over menus, windows, messages, and layers (each menu may have tooltips or other objects)
// Warnings are for anything from menus to popups or anything


//remove these?
////layerDepth_popups = layerDepth_menus - 1;


////layerDepth_warnings = layerDepth_popups - 1;


