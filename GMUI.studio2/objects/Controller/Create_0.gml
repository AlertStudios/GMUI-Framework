/// @description Create the GMUI instance
// This would typically be in your game's controller object
// You must call the initialization script before making any GMUI interfaces

// EXAMPLE: Make sure its only called once
// It calling more than once will just silently fail, so this is optional:
if (instance_number(self) > 1) {
    instance_destroy();
    exit;
}

// Start GMUI (only needed once per game)
GMUI_Init();

// GMUI_Init also calls GMUI_Settings() and GMUI_SetLayerDepths()
// for further customization.


// CREATE YOUR GRIDS NOW
// CREATING A GRID CREATES A NEW INSTANCE OF OBJECT AND CREATES NEW GMUI INSTANCE WITH INTERFACE SCRIPT
// JUST ADD GMUI_Draw() TO THE DRAW EVENT OF THE GMUI OBJECT
// AND ADD GMUI_ControlDraw(true) TO THE DRAW EVENT OF THE CONTROL OBJECT

// Just using a Demo varible for _Switch_Button and _Swipe_Button
global.Switched = false;
global.Swiped = false;
global.showsurface = 0;


// Call initiation script with name and cell size of 16 (or use 0 for default size). Returns the GMUI id.
newGMUI = GMUI_Create(GMUI,_Test_Form,16,0); // e.g. newGMUI will have id of 1

