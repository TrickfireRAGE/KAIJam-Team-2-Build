/// @description ???

switch (room)
{
	case(rm_start):
		// Incase we get Intro
		break;
	case(rm_main):
		var _relicTotal = instance_number(obj_relic);
		_relicTotal += instance_number(obj_tunnelRelic);
		global.totalRelics = _relicTotal;
		global.amountTunnelRelics = instance_number(obj_tunnelRelic);
		
		audio_play_sound(snd_backgroundMusic, 0, true);
		break;
	case(rm_end):
		audio_stop_all();
		// In case we get Victory
		break;
}



