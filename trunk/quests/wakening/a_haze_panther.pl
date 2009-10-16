sub EVENT_SPAWN 
{
	quest::settimer(1,1);
}

sub EVENT_TIMER 
{
	quest::npcrace(240);
	quest::stoptimer(1);
}

sub EVENT_COMBAT {
	if($combat_state = 1)
	{
		quest::npcrace(76);
	}
}