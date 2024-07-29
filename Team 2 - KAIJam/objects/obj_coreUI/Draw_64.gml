/// @description 

switch(room)
{
	case(rm_start):
		//
		break;
	case(rm_main):
		// Variables
		var _scoreString = "Score: ";
		var _displaySize = window_get_height();
		var _displayScaling = (_displaySize / 1080) * 3;
		var _xPositionScore = 0; // Potential to change if Align doesn't work
		var _yPositionScore = 0;
		var _xPositionTimer = 0;
		var _yPositionTimer = 0;
		var _textColour = c_white; // Subject to change
		var _textAlpha = 1;
		var _timerString = string_replace_all(string_format(global.gameTimerMinutes, 2, 0) + ":" + string_format(global.gameTimerSeconds, 2, 0)," ", 0);
		
		// Visual Code
		// Alignment (Used to keep in top left of window)
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		
		// Score Text UI (Recode this to work depending on what level they are at.
		/*draw_text_transformed_colour(_xPositionScore, _yPositionScore,
			_scoreString + string(score), _displayScaling,
			_displayScaling, 0, _textColour,
			_textColour, _textColour, _textColour,
			_textAlpha);*/
		
		// Timer UI
		draw_text_transformed_colour(_xPositionTimer, _yPositionTimer,
			_timerString, _displayScaling,
			_displayScaling, 0, _textColour,
			_textColour, _textColour, _textColour,
			_textAlpha)
		break;
	case(rm_end):
		//
		break;
}


