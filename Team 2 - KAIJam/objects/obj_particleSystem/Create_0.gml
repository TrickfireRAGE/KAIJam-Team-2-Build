/// @description ???

particleSystem = part_system_create();

particleTypeBubbles = part_type_create();

// Variables
var _sizeMinimumBubble = 1;
var _sizeMaximumBubble = 2;

var _lifeBubbleMinimum = 15;
var _lifeBubbleMaximum = 15;

var _alphaBubble1 = 0.3;
var _alphaBubble2 = 0.6;
var _alphaBubble3 = 1;


// Particle System for Bubble
part_type_sprite(particleTypeBubbles, spr_bubble,
	false, false, false);
part_type_size(particleTypeBubbles, _sizeMinimumBubble, _sizeMaximumBubble, 
	0.1, 0);
part_type_life(particleTypeBubbles, _lifeBubbleMinimum, 
	_lifeBubbleMaximum); 
part_type_alpha3(particleTypeBubbles, _alphaBubble1,
	_alphaBubble2, _alphaBubble3);
// Put Colour here if needed

