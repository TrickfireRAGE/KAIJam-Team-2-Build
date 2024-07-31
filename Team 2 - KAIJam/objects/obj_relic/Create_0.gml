/// @description Randomly Changes Sprite

var _spriteNumber;
var _imageNumber;

sprite_index = spr_relic;

_spriteNumber = sprite_get_number(sprite_index);

_imageNumber = irandom_range(0, _spriteNumber);

image_index = _imageNumber;

relicValue = "NOT_SET";
collisionPlayer = false; // Used to see if the player has collided with them.
timerRegen = false; // Stays at false unless player dies.
counter = 0; // here to give enough frames to destory relic

var _yBeginning = 290;
_yScoring = y - _yBeginning;
var _roomHeight = room_height - _yBeginning;

_seaDepth = [];
_seaDepth[0] = ceil(_roomHeight * 0.1);
_seaDepth[1] = ceil(_roomHeight * 0.2);
_seaDepth[2] = ceil(_roomHeight * 0.3);
_seaDepth[3] = ceil(_roomHeight * 0.4);
_seaDepth[4] = ceil(_roomHeight * 0.5);
_seaDepth[5] = ceil(_roomHeight * 0.6);
_seaDepth[6] = ceil(_roomHeight * 0.7);
_seaDepth[7] = ceil(_roomHeight * 0.8);
_seaDepth[8] = ceil(_roomHeight * 0.9);

if (_yScoring <= 270)
{
	relicValue = 5;
}
else if (_yScoring <= _seaDepth[1])
{
	relicValue = 10;
}
else if (_yScoring <= _seaDepth[2])
{
	relicValue = 15;
}
else if (_yScoring <= _seaDepth[3])
{
	relicValue = 20;
}
else if (_yScoring <= _seaDepth[4])
{
	relicValue = 25;
}
else if (_yScoring <= _seaDepth[5])
{
	relicValue = 30;
}
else if (_yScoring <= _seaDepth[6])
{
	relicValue = 35;
}
else if (_yScoring <= _seaDepth[7])
{
	relicValue = 40;
}
else if (_yScoring <= _seaDepth[8])
{
	relicValue = 45;
}
else
{
	relicValue = 50;
}

