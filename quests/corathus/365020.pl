#duke

sub EVENT_COMBAT
{
	if($combat_state == 0)
	{
		quest::signalwith(365057, 5, 0);	
	}
	elsif($combat_state == 1)
	{
		quest::signalwith(365057, 4, 0);
	}
}

sub EVENT_DEATH
{
	quest::signalwith(365057, 6, 0);
	quest::signalwith(365004, 4, 0);
}