function _Debug_Button() {
	// Show/hide debug for the first interface
	if ((GMUIid(1)).DebugData) {
	    (GMUIid(1)).DebugData = false;
	}
	else {
	    (GMUIid(1)).DebugData = true;
	}

}

