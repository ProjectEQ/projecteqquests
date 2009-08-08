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
		quest::stoptimer("flavor_text");
	}
}

sub EVENT_DEATH
{
	quest::signalwith(365057, 12, 0);
	quest::signalwith(365004, 3, 0);
}

sub EVENT_SPAWN
{
	quest::settimer("flavor_text", 10);
}

sub EVENT_TIMER
{
	if($timer eq "flavor_text")
	{
		if(rand(100) <= 10.0)
		{
			#do our flavor here
		}
	}
}