sub EVENT_SPELL_EFFECT_CLIENT
{
	if(($client->GetClientVersionBit() & 2147483660)!= 0)
	{
		quest::MovePCInstance(25, 1, -715, -57, 42, 0);
	}
	else
	{
		quest::movepc(25, -772, 432, 35);
	}
}