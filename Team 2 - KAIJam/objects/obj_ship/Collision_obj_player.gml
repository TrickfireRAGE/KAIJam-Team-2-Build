/// @description ???

if (global.playerRelicCollected == true)
{
	global.scoreRelic += 1;
	score += global.collectedRelicValue;
	instance_destroy(global.relicInstanceID);
	global.relicInstanceID = "NOT_SET";
	global.collectedRelicValue = 0;
	global.playerRelicCollected = false;
	
	if (global.playerRelicCollectedTunnel == true)
	{
		global.tunnelRelics += 1;
	}
}
