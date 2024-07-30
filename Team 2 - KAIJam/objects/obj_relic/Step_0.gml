/// @description ???

if (collisionPlayer == true && global.playerRelicCollected == false) 
{  // For when the player gets touched by the monster.
	if (counter != 0)
	{
		if (timerRegen == true)
		{
			collisionPlayer = false;
			timerRegen = false;
		}
		else if (timerRegen == false)
		{
		
			alarm_set(0, 1);
			timerRegen = true;
		}
	}
	else if (counter == 0)
	{
		counter += 1;
	}
	
}


