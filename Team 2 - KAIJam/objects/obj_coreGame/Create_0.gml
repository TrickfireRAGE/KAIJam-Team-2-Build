/// @description ???

// Display Initialisation Code
var _displaySize = display_get_height() / 4;
_displaySize *= 3;

window_set_size(_displaySize, _displaySize);
surface_resize(application_surface, _displaySize, _displaySize);

// Key Variables

score = 0;
var _duration = 10; // How many minutes will the game last.
var _timerMinutes = _duration * 60;
global.gameTimer = game_get_speed(gamespeed_fps) * _timerMinutes;
global.gameTimerSeconds = 0;
global.gameTimerMinutes = _duration;

internalCounter = 0;
// Potentially change this above to have to seperate variables for seconds and minutes
// for a better visual experience.


// Put more code in here