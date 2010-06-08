sub EVENT_SPELL_EFFECT_CLIENT
{
	if(($client->GetClientVersionBit() & 2147483660)!= 0)
	{
		quest::MovePCInstance(25, 1, -924, 1401, 46, 0);
	}
	else
	{
		quest::movepc(25, -207, -1186, -5);
	}
}