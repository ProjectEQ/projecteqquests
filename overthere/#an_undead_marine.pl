sub EVENT_SPAWN{
	quest::settimer(1,640);
}

sub EVENT_TIMER {
	quest::depop();
}