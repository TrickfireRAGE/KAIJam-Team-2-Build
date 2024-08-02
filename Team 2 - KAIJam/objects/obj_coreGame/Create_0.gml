/// @description ???

// Display Initialisation Code
var _displaySize = display_get_height() / 4;
_displaySize *= 3;

window_set_size(_displaySize, _displaySize);
surface_resize(application_surface, _displaySize, _displaySize);

// Key Variables
// Timer Code

var _duration = 10; // How many minutes will the game last.
var _timerMinutes = _duration * 60;
global.gameTimer = game_get_speed(gamespeed_fps) * _timerMinutes;
global.gameTimerSeconds = 0;
global.gameTimerMinutes = _duration;

internalCounter = 0;

// Relic/Score Code

score = 0;
global.scoreRelic = 0; // Used for the amount of relics collected
global.relicInstanceID = "NOT_SET";
global.collectedRelicValue = "NOT_SET";
global.playerRelicCollected = false;
global.playerRelicCollectedTunnel = false;
monsterSpawned = false; // To prevent endless spawning of the Monster
global.tunnelRelics = 0; // Used to get the monsters.
global.totalRelics = "NOT_SET";
global.amountTunnelRelics = "NOT_SET"; // In case more are added in future.




// Put more code in here
