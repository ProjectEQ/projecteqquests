#general two: robot

sub EVENT_COMBAT
{
	if($combat_state == 0)
	{
		quest::signalwith(365057, 11, 0);	
	}
	elsif($combat_state == 1)
	{
		quest::signalwith(365057, 10, 0);
	}
}

sub EVENT_DEATH
{
	quest::signalwith(365057, 12, 0);
	quest::signalwith(365004, 3, 0);
}