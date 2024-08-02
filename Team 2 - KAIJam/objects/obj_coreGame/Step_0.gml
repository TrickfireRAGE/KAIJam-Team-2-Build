/// @description ???

switch (room)
{
	case(rm_start):
		if (keyboard_check_pressed(vk_enter))
		{
			// Maybe put fading or effect code before it switches to the main room
			room = rm_main;
		}
		break;
	case(rm_main):
		// Timer Code
		global.gameTimer -= 1; // For the Logic code
		internalCounter += 1;
		
		if (internalCounter == game_get_speed(gamespeed_fps)) // To ensure coreUI runs intandum with coreGame.
		{
			global.gameTimerSeconds -= 1;
			
			if (global.gameTimerSeconds < 0)
			{
				global.gameTimerSeconds = 59;
				global.gameTimerMinutes -= 1;
			}
			
			internalCounter = 0;
		}
		
		if (global.gameTimer == 0) // Timer Ending Code
		{
			room = rm_end;
		}
		
		// Main Game Logic
		
		if (global.tunnelRelics == 1 && monsterSpawned == false)
		{
			instance_create_layer(obj_monsterSpawn.x, obj_monsterSpawn.y,
				"Instances", obj_monster);
			monsterSpawned = true;
		}
		
		break;
	case(rm_end):
		if (keyboard_check_pressed(vk_enter))
		{
			game_restart();
		}
		break;
}


