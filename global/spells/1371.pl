sub EVENT_SPELL_EFFECT_TRANSLOCATE_COMPLETE
{
	if($client && ($client->GetClientVersionBit() & 4294967292)!= 0)
	{
		quest::MovePCInstance(25, 1, -715, -57, 42, 0); # Zone: bloodfields
	}
	else
	{
		quest::movepc(25, -772, 432, 35); # Zone: bloodfields
	}
}