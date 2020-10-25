///GMUI_CreateEvent(Form Script, Cell Width, Cell Height)
///Called from creation of new GMUI instance for the grid interfaces and variables

// // Create grid variables
// Is this already using a GMUI? Assign the instance number as long as its not
var isOk,G;
isOk = true;
for (G=1;G<=global.GMUIii;G+=1) {
    if (id = global.GMUIiid[G]) {
        isOk = false;
        break;
    }
}
    
if (!isOk)
    return 0;
else {
    // New ID
    global.GMUIii += 1;
}

// Define the instance & number running GMUI
global.GMUIiid[global.GMUIii] = id;
GMUInumber = global.GMUIii;
// Current grid is now this one. The 0 index is the currently active grid
global.GMUIiid[0] = id;


// Initial time to not execute any actions from the grid
InitialDisable = floor(room_speed/20); // Default 1/20th of a second
// Freeing GMUI data
RemovingGMUI = false;
// Layer that is currently enabled (0 is the bottom-most)
UILayer = 0;
// Highest layer, for reference
UILayerTop = 0;
// Layer that was enabled before the current
UILayerPrevious = 0;
// Layer that is being added to
UIAddToLayer = 0;
// Will only switch layer being added to until complete
UIInterfaceSet = false;
// Will skip the animations and fading when defining form
UIDrawAnimations = false;

// Other specific functionality settings that can be turned off if unwanted
GMUI_Settings();
GMUI_SetConfirmKey(global.GMUIConfirmKey);
GMUI_SetControlObject(global.GMUI_controlobject);
GMUI_SetDepth(global.GMUIDepth);
GMUI_SetDoubleSelect(global.GMUIAllowDoubleSelect);
GMUI_SetViewSnap(global.UIsnaptoview, global.UIgridview);
GMUI_UseSurfaces(global.UIEnableSurfaces);

// Set the default layering depths
GMUI_SetLayerDepths();

// Previous values of the mouse to determine if it has moved or not
mouse_px = 0;
mouse_py = 0;
previousHoveringControl = -1;

// Debug information
if (DebugData) {
    TestInRegion = -1;
    TestOnDirection = -1;
    TestHoverObject = -1;
}
    
// Rather pointless to be redundant but it gives more flexibility if you really need it...
persistence = persistent;

// Error management (DEBUG)
GMUI_Error[0] = "";
GMUI_ErrorNumber = 0;

    
// Get cellsize arguments (w,h)
if (argument1 < 1)
    cellsize = 16;
else
    cellsize = argument1;
if (argument2 < 1)
    cellsize_h = cellsize;
else
    cellsize_h = argument2;
    
// Set the interface area for new layers, using view 0 if enabled. Can be adjusted later
GMUI_CreateSetDefaultArea();



// Grid setup (New layers will have their own grids)
GMUI_gridlist = ds_list_create();
GMUI_defaultX = 0;
GMUI_defaultY = 0;
GMUI_grid_Transition = false; // Any layer is transitioning flag

GMUI_AddLayer(0,GMUI_defaultX,GMUI_defaultY);

// Navigation settings
GMUI_navigateDirection = -1;
GMUI_backKey = -1;
GMUI_forwardKey = -1;
GMUI_backAltKey = -1;
GMUI_forwardAltKey = -1;
GMUI_enableTab = true;


// Map setup for control name keys to instances
GMUI_map = ds_map_create();

// List of all controls
GMUI_controlList = ds_list_create();

// Create all of the default control settings (init to GMUI defaults)
GMUI_ControlDefaultsInit();
// If defaults script defined, run that now
if (global.GMUIDefaults > -1)
    script_execute(global.GMUIDefaults);

// Currently hovering or selecting on control for controls to revert if not them
HoveringControl = -1;
SelectedControl = -1;
PreviousSelectedControl = -1;

// Request to update the layer region
NeedsRegionsUpdate = false;

// An offset change will trigger repositioning controls
previousXOffset = 0;
previousYOffset = 0;


// Map setup for menu name keys to group id's
GMUI_menu_map = ds_map_create();
GMUI_menu_layer = layerDepth_maxLayers;

GMUI_menuLastId = 0;
GMUI_menuCurrent = 0;
GMUI_menuOpenCount = 0;
GMUI_menuResponse = 0; // Cancel:-1, No: 0, Yes: 1

// Popup setup for popup name keys to group id's; uses menu id's for reference
GMUI_popup_map = ds_map_create();

// Warnings
GMUI_warnings_map = ds_map_create();

// Add list of scrollbar controls
GMUI_groupScrollbars = ds_list_create();


// Grouping variables (handled in GMUI_AddLayer())
// List of groups per layer [layer number; default 0]
//GMUI_groupList[0] = ds_list_create();
// List of controls per group [layer number, group number]
//GMUI_groupControlList[0,0] = ds_list_create();

//Positioning
GMUI_groupCellX[0,0] = 0;
GMUI_groupCellY[0,0] = 0;
GMUI_groupActualX[0,0] = 0;
GMUI_groupActualY[0,0] = 0;
GMUI_groupRelativeX[0,0] = 0;
GMUI_groupRelativeY[0,0] = 0;
GMUI_groupCellsW[0,0] = 0;
GMUI_groupCellsH[0,0] = 0;
GMUI_groupRelativeCellX[0,0] = 0;
GMUI_groupRelativeCellY[0,0] = 0;
GMUI_groupAnchor[0,0] = global.GMUIAnchorDefault;
GMUI_groupClickOff[0,0] = false;
GMUI_controlClickOff = -1;
GMUI_groupTransitioning[0,0] = false;
//GMUI_groupTransitioningControl[0,0] = -1;
GMUI_groupAction[0,0] = -1;
GMUI_groupSettingsMap[0,0] = -1;
GMUI_groupStretch[0,0] = global.GMUIAnchorCenter;


// Call the form code to create the interface
GMUI_SetForm(argument0);
UIInterfaceSet = true;
GMUI_GridSetAllGroupValues(id);
//GMUI_GridSetAllMenuValues(id);
GMUI_GridSetRegions();

// Upon success, give the GMUI id back
return GMUInumber;

