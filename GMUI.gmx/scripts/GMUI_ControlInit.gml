///GMUI_ControlInit(control object to instantiate)
/// Initialize the values to use with a GMUI control
// These values are controlled by the GMUI controller, and if commented, they are actually intialized by the Add script.

var i; i = argument0;

if (!instance_exists(i))
    return false;
    
// The parent GMUI Instance
i.GMUIP = -1;

// Previous menu if control is in a menu
i.PreviousMenu = 0;
i.PreviousMenuLayer = 0;


i.Hovering = 0;
i.Selected = 0;
i.DoubleSelected = 0;
i.Holding = 0;
i.HoldingTime = 0;
i.HoldingThreshold = 5; // Steps before a click is registed as a holding click

i.ControlType = "";
i.ControlDataType = global.GMUIDataTypeString; // Default (0)

i.NeedsPositionUpdate = false;
i.NeedsDrawUpdate = false;
i.NeedsHideUpdate = false; //not needed?
i.NeedsGroupUpdate = false;

// Redundant control options based on the datatype
i.ControlIsNumeric = false;
i.ControlIsString = true;
i.ControlInput = false;
i.ControlPicker = false;

i.ControlShowValue = true;
i.ControlInteraction = true;
i.ControlSelectable = true;

// For specific controls
i.checkMouseX = 0;
i.checkMouseY = 0;
i.HoveringDirection = 0; // 0 = middle/none (HoveringDirection_None), HoveringDirection_Right=1;HoveringDirection_Up=2;HoveringDirection_Left=3;HoveringDirection_Down=4;
i.toggleInitialized = true; // default skip toggle values
i.optionsInitialized = true; // default skip option values

// Control Status
i.Disabled = 0;
i.Hidden = 0;

// Group Status (if master control)
i.GroupHidden = false;
i.GroupIsFading = false;

// NonClickable may be used when a control is moving, for instance. It does not show disabled, but will not register a click
i.NonClickable = 0;

// Custom Actions
i.ActionScript = -1;
i.HoverActionScript = -1;
i.HoverOffActionScript = -1;
i.SelectingActionScript = -1;
i.DeselectActionScript = -1;
i.ValueChangedActionScript = -1;

// All of these values are set when added ::

// Layer can disable the control if a higher layer is opened (0 is default)
//Layer = 0;
// Control can be added to an additional layer and work in both and any layers in-between
i.AdditionalLayer = -1;

// Group allows actions for a group of controls, such as disabling, moving, and hiding (0 is no-group)
//Group = 0;

// Cells work like the room grid and are assigned numbers baised on the cell dimensions given
//CellWide = 1;
//CellHigh = 1;
//CellWideMax = 1;
//CellHighMax = 1;
//CellX = 0;
//CellY = 0;

// Horizontal font alignment always set on creation
//ControlFontAlign = fa_left;
i.ControlFontAlignV = fa_middle;
i.ControlPaddingX = 4;
i.ControlPaddingY = 4;

// ::


// Positioning variables
i.IsAdjusted = false;
// Actual size may be used to use pixel-baised boundary box for the control; still must be within cell block (0 is full cell)
i.ActualW = 0;
i.ActualH = 0;

// Relative position is used if the boundary box should be adjusted
i.RelativeX = 0;
i.RelativeY = 0;

// Actual location may be used when moving controls, however the selection will need to change the grid cell it is in
i.ActualX = x;
i.ActualY = y;

// Real room location after adjustments made to the grid, boundary, and offsets
i.RoomX = 0;
i.RoomY = 0;
i.RoomW = 0;
i.RoomH = 0;

// Graphical variables
i.outboundMax = ceil(room_speed/3);
i.outbound = 0;
i.inboundMax = ceil(room_speed/3);
i.inbound = 0;

// Tooltip variables (relative)
i.TooltipId = -1;
i.TT_arrowsize = 16;
i.TT_xposition = 0;
i.TT_yposition = 0;
i.TT_direction = 0;
i.TT_minx = 0;
i.TT_miny = 0;
i.TT_maxx = 0;
i.TT_maxy = 0;
i.TT_relativeCellX = 0;
i.TT_relativeCellY = 0;

// Transitions: time: t, begin: xy, change: xy, delta: d
i.Transitioning = false;
i.TransitioningGroup = false;
i.TransitionScript = -1;

i.T_t = 0;
i.T_bx = 0;
i.T_cx = 0;
i.T_by = 0;
i.T_cy = 0;
i.T_d = room_speed;

i.T_bx_group = 0;
i.T_by_group = 0;
i.T_cx_group = 0;
i.T_cy_group = 0;

// Destination coordinates
i.T_dx_group = 0;
i.T_dy_group = 0;

// For hide positioning
i.T_hx_group = 0;
i.T_hy_group = 0;
i.T_hrelx_group = 0;
i.T_hrely_group = 0;
i.T_px_group = 0;
i.T_py_group = 0;
i.T_hscript_group = -1;
i.T_hspeed_group = 0; // User must set speed to activate

// Effects
i.FadeAlpha = 1; // of 1
i.FadeIn = 1;
i.FadeOut = 0;
i.FadeTime = room_speed; // in steps
i.FadeCalled = 0; // 0 for none, 1 for up, -1 for down
i.FadeOnHide = false;
i.FadeMode = 0; // Fade Mode: 0 = fade dimmest last, 1 = fade all together


// Value variables
i.value = 0;
i.valueString = "0";
i.valueSetting = 0;
i.valuePrevious = i.value;
i.valueStringPrevious = i.valueString;
i.valueChangeDetected = 0;



/// ???:
// The control will be disabled for this many steps before allowing action
//i.Disable = floor(room_speed/20);
