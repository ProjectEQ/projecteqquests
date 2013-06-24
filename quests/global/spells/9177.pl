sub EVENT_SPELL_EFFECT_CLIENT
{
	if(($client->GetClientVersionBit() & 4294967264)!= 0)
	{
		quest::MovePCInstance(344,5,0,375,2,256);
	}
	else
	{
		quest::movepc(344,0,375,2,256);
	}
}