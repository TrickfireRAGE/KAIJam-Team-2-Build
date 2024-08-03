/// @description ???

// Need to put an if statement here for if the monster gets too close to the surface

//initialise variables
var _cutoffY = 4500; 

switch (state) // To see how many relics have been collected
{
	case(e_state.idle):{// the monster stays at it's spawn unless the player gets too close or collects a certain number of relics
		
		var _spd = 0;
		
		//placeholder value for relics collected
		if (global.scoreRelic > 3){
			state = e_state.chase_slow;
		}
		else if (distance_to_object(obj_player) < 100){//distance value is placeholder
			state = e_state.chase_slow;
		}
	}
	break;
	
	case(e_state.chase_slow):{// This begins the slow movement of the monster
		
		var _spd = 3;
		
		if (obj_player.y < _cutoffY)
		{
			state = e_state.retreat;
		}
		else if (obj_player.y > _cutoffY) // Doesn't work yet as it doesn't exit path
		{
			path_end();
			move_towards_point(obj_player.x, obj_player.y, _spd);
		}
		else if (global.scoreRelic > 5){
			state = e_state.chase_fast;
		}
		else if (distance_to_object(obj_player) < 200) and (global.scoreRelic < 3){// placeholder values for state reset
			state = e_state.retreat;
		}
		else if (path_index != pathMonsterIdle)
		{
			path_start(pathMonsterIdle, _spd, path_action_continue, true);
		}
	}
	break;
	
	case(e_state.chase_fast):{
		
		var _spd = 6; 
		
		if (obj_player.y < _cutoffY)
		{
			state = e_state.retreat;
		}
		else if (path_index != pathMonsterIdle)
		{
			path_start(pathMonsterIdle, _spd, path_action_continue, true);
		}
	}
	break;
	
	case(e_state.retreat):{
		
	}
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

var _spd = 1; // Have an adapting speed in future versions.





