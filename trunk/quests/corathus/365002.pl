#general one: mushroom

sub EVENT_COMBAT
{
	if($combat_state == 0)
	{
		quest::signalwith(365057, 8, 0);	
	}
	elsif($combat_state == 1)
	{
		quest::signalwith(365057, 7, 0);
		quest::stoptimer("flavor_text");
	}
}

sub EVENT_DEATH
{
	quest::signalwith(365057, 9, 0);
	quest::signalwith(365004, 2, 0);
}