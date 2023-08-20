sub EVENT_SPELL_EFFECT_CLIENT
{
	if(quest::is_depths_of_darkhollow_enabled())
	{
		quest::MovePCInstance(25, 1, -924, 1401, 46, 0); # Zone: nektulos
	}
	else
	{
		quest::movepc(25, -207, -1186, -5); # Zone: nektulos
	}
}