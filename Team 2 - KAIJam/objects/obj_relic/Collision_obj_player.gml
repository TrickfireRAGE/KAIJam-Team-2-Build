/// @description ???

if (collisionPlayer == false)
{
	global.collectedRelicValue = relicValue;
	global.relicInstanceID = instance_id;
	global.playerRelicCollected = true;
	image_alpha = 0; // To make it appear the object has been picked up
	// PUT SOUND EFFECT HERE
	
	collisionPlayer = true;
}
else if (collisionPlayer == true)
{
	// In case there needs to be more code here in the future.
}


