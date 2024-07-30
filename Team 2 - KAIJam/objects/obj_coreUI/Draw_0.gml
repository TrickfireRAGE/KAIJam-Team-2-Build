/// @description Using Draw for Time Sake

switch (room)
{
	case(rm_start):
		// Variables
		var _xPosition = 250;
		var _yPositionName = 100;
		var _yPositionStart = 350;
		var _gameName = "Dredgecore Boatmaxxing"; // Temp
		var _startString = "Press Enter To Begin";
		var _colourText = c_white; // Temp
		var _textScaleName = 3;
		var _textScaleStart = 2;
		var _textAlphaName = 1; // Here incase I want to do a slow fade
		var _textAlphaStart = 1; // ^
		
		// Visual Code
		// Setting Horizonal Alignment
		draw_set_halign(fa_center); // Potentially change this if it becomes an issue.
		
		// Title Text
		draw_text_transformed_colour(_xPosition, _yPositionName,
			_gameName, _textScaleName, _textScaleName,
			0, _colourText, _colourText, _colourText, _colourText,
			_textAlphaName);
		// Start Text
		draw_text_transformed_colour(_xPosition, _yPositionStart,
			_startString, _textScaleStart, _textScaleStart,
			0, _colourText, _colourText, _colourText, _colourText,
			_textAlphaStart);
		
		
		break;
	case(rm_main):
		// Using the masking (Partly used Tutorial and mixed in a lot of personal code to get animated look.
		if (!surface_exists(maskingSurface))
		{
			maskingSurface = surface_create(room_width, room_height);
		}
		
		surface_set_target(maskingSurface);
		
		aboveWaterLayerID = layer_get_id("TileSetTest");
		aboveWaterLayer = layer_tilemap_get_id(aboveWaterLayerID);
		
		// Swap to tileset or something else once background assets are done.
		draw_tilemap(aboveWaterLayer, 0, 0);
		
		var _xIncreaseMask = 600;
		var _yPositionMask = 80;
		var _maskLength = 600;
		
		var _spritesNeeded = (room_width / _maskLength) + 1; // The extra one is to account for the first sprite.
		_spritesNeeded = ceil(_spritesNeeded);
		
		gpu_set_blendmode(bm_subtract);
		draw_set_colour(c_black);
		if (maskingTimer == 0)
		{
			maskingTimer = -600;
		}
		
		for (var i = 0; i <= _spritesNeeded; i++)
		{
			draw_sprite(spr_waveMask1, 0, maskingTimer + (_xIncreaseMask * i), _yPositionMask);
		}
		maskingTimer += 1;
			
		gpu_set_blendmode(bm_normal);
		
		surface_reset_target();
		
		layer_set_visible(aboveWaterLayerID, 0);
		draw_surface(maskingSurface, 0, 0);
		
		
		
		
		break;
	case(rm_end):
		// Variables
		var _xPosition = 250;
		var _yPositionScore = 100;
		var _yPositionRelic = 150;
		var _yPositionRestart = 350;
		var _scoreString = "Score: " + string(score); // Temp
		var _relicString = "Relics Collected: " + string(global.scoreRelic) + "/ ??"; // Put the actual amount as a variable.
		var _restartString = "Press Enter To Restart Game";
		var _colourText = c_white; // Temp
		var _textScaleScore = 3;
		var _textScaleRestart = 2;
		var _textAlphaScore = 1; // Here incase I want to do a slow fade
		var _textAlphaRestart = 1; // ^
		
		// Visual Code
		// Setting Horizonal Alignment
		draw_set_halign(fa_center); // Potentially change this if it becomes an issue.
		
		// Score Text
		draw_text_transformed_colour(_xPosition, _yPositionScore,
			_scoreString, _textScaleScore, _textScaleScore,
			0, _colourText, _colourText, _colourText, _colourText,
			_textAlphaScore);
		// Relic Text
		draw_text_transformed_colour(_xPosition, _yPositionRelic,
			_relicString, _textScaleScore, _textScaleScore,
			0, _colourText, _colourText, _colourText, _colourText,
			_textAlphaScore);
		// Restart Text
		draw_text_transformed_colour(_xPosition, _yPositionRestart,
			_restartString, _textScaleRestart, _textScaleRestart,
			0, _colourText, _colourText, _colourText, _colourText,
			_textAlphaRestart);
			
		break;
}


