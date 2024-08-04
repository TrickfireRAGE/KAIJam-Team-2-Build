/// @description ???

// Need to put an if statement here for if the monster gets too close to the surface

//initialise variables
var _cutoffY = 4500; 

switch (state) // To see how many relics have been collected
{
	case(e_state.idle):{// the monster randomly patrols arround it's spawn unless the player gets too close or collects a certain number of relics
		
		var _spd = 2;
		
		if (distance_to_point(xstart, ystart) > 120){//patrol distance is placeholder
			direction = point_direction(x, y, xstart, ystart);	
		}
		else if (global.scoreRelic > 3){//placeholder value for relics collected
			state = e_state.chase_slow;
		}
		else if (distance_to_object(obj_player) < 100){//distance value is placeholder
			state = e_state.chase_slow;
		}
		else {
			direction = random(360)	
		}
	}
	break;
	
	case(e_state.chase_slow):{// This begins the slow movement of the monster
		
		var _spd = 3;
		
		if (obj_player.y < _cutoffY)
		{
			state = e_state.retreat;
		}
		else if (obj_player.y > _cutoffY)
		{
			path_delete(path);
			path = path_add();
			mp_grid_path(grid, path, x, y, obj_player.x, obj_player.y, true);
			path_start(path, _spd, path_action_continue, false);
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
	
	case(e_state.chase_fast):{// This beings the fast movement of the monster
		
		var _spd = 5; 
		
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
	
	case(e_state.retreat):{// the monster returns to it's spawn unless the player decides to fuck around
		
		var _spd = 3;
		
		
		if (distance_to_point(xstart, ystart) < 10){
			path_end();
			state = e_state.idle;	
		}
		else if (global.scoreRelic > 3) and (obj_player.y > _cutoffY){//placeholder value for relics collected
			path_end();
			state = e_state.chase_slow;
		}
		else if (distance_to_object(obj_player) < 100) and (obj_player.y > _cutoffY){//distance value is placeholder
			path_end();
			state = e_state.chase_slow;
		}
		else {// returns the monster to it's spawn location
			path_delete(path);
			path = path_add();
			mp_grid_path(grid, path, x, y, xstart, ystart, true);
			path_start(path, _spd, path_action_continue, false);
		}
	}
	break;
	// here would be more of the cases once the system works to have a gradual increase in speed.
}

// Basic Moving AI Code

// Make sure to keep the monster in only the Tunnel Layer
// Only appears after the first relic collected inside the Tunnel area
// When there is only one Relic left, then the Monster will venture outside into the glowing rocks
// Could also have the monster teleport every 1/2 minutes near the player (Outside of players view)






