#define GMUI_Create
/// Call creation of the grid interfaces and variables

// Create resizable method for window?


// // Create grid variables
    // Is this already using a GMUI? Assign the instance number as long as its not
    var isOk,G;
    isOk = 1;
    for (G=1;G<=global.GMUIii;G+=1) {
        if (id = global.GMUIiid[G]) {
            isOk = 0;
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
    // Current grid is now this one
    global.GMUIiid = id;
    
    
    // Initial time to not execute any actions from the grid
    InitalDisable = floor(room_speed/20); // Default 1/20th of a second
    // Layer that is currently enabled (0 is the bottom-most)
    UILayer = 0;
    // Highest layer, for reference
    UILayerTop = 0;
    
    // Other specific functionality settings that can be turned off if unwanted
    GMUI_Settings(argument0);
    
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

    
// Get cellsize arguments (w,h)
if (argument1 < 1)
    cellsize = 16;
else
    cellsize = argument1;
if (argument2 < 1)
    cellsize_h = cellsize;
else
    cellsize_h = argument2;
    
// Rather pointless to be redundant but it gives more flexibility if you really need it...
persistence = persistent;


// Grid setup (New layers will have their own grids)
GMUI_grid[0] = ds_grid_create(ceil(room_width/cellsize),ceil(room_height/cellsize_h));
GMUI_grid_x[0] = 0;
GMUI_grid_y[0] = 0;

GMUI_gridlist = ds_list_create();
ds_list_add(GMUI_gridlist,0);

// Error management (DEBUG)
GMUI_Error[0] = "";
GMUI_ErrorNumber = 0;

// Initial Disable steps for the Grid checks
InitialDisable = 5;


// Map setup for control name keys to instances
GMUI_map = ds_map_create();

// List of all controls
GMUI_controlList = ds_list_create();

// Create all of the default control settings
GMUI_SetControlDefaults();

// Currently hovering or selecting on control for controls to revert if not them
HoveringControl = -1;
SelectedControl = -1;
PreviousSelectedControl = -1;


// Grouping variables
// List of groups per layer [layer number; default 0]
GMUI_groupList[0] = ds_list_create();
// List of controls per group [layer number, group number]
GMUI_groupControlList = ds_list_create();
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
GMUI_groupAnchor[0,0] = global.GMUIAnchorTopLeft;

// Call the form code to create the interface
GMUI_Form(argument0);
GMUI_GridSetRegions();

// Upon success, give the GMUI id back
return GMUInumber;


