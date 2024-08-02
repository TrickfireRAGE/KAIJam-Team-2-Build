/// @description ???

switch (room)
{
	case(rm_start):
		//
		break;
	case(rm_main):
		var _relicTotal = instance_number(obj_relic);
		_relicTotal += instance_number(obj_tunnelRelic);
		global.totalRelics = _relicTotal;
		global.amountTunnelRelics = instance_number(obj_tunnelRelic);
		break;
	case(rm_end):
		//
		break;
}



