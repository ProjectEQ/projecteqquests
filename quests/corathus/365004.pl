#council king
sub EVENT_COMBAT
{
	if($combat_state == 0)
	{
		quest::signalwith(365057, 2, 0);	
	}
	elsif($combat_state == 1)
	{
		quest::signalwith(365057, 1, 0);
	}
}

sub EVENT_DEATH
{
	quest::signalwith(365057, 3, 0);
}

sub EVENT_SIGNAL
{
	quest::emote("roars with rage as his comrade falls.");
}