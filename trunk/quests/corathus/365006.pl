#council fairy
sub EVENT_COMBAT
{
	if($combat_state == 0)
	{
		quest::signalwith(365057, 14, 0);
	}
	elsif($combat_state == 1)
	{
		quest::signalwith(365057, 13, 0);
	}
}

sub EVENT_DEATH
{
	quest::signalwith(365057, 15, 0);
	quest::signalwith(365004, 1, 0);
}