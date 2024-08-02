/// @description ???

// Need to put an if statement here for if the monster gets too close to the surface

switch (global.scoreRelic) // To see how many relics have been collected
{
	case(1):
	case(2):
		// Put code here if the monster is going to be doing anything
		break;
	case(3):
		// This begins the slow movement of the monster
		break;
	// here would be more of the cases once the system works to have a gradual increase in speed.
	default:
		// Default will have the max speed as it would have been after enough Relics are collected
}

// Basic Moving AI Code

// Make sure to keep the monster in only the Tunnel Layer
// Only appears after the first relic collected inside the Tunnel area
// When there is only one Relic left, then the Monster will venture outside into the glowing rocks
// Could also have the monster teleport every 1/2 minutes near the player (Outside of players view)

// Variables

var _cutoffY = 4500; 
var _spd = 1; // Have an adapting speed in future versions.

if (obj_player.y < _cutoffY)
{
	path_start(pathMonsterIdle, _spd, path_action_continue, true);
}
else if (obj_player.y > _cutoffY) // Doesn't work yet as it doesn't exit path
{
	move_towards_point(obj_player.x, obj_player.y, _spd);
}



