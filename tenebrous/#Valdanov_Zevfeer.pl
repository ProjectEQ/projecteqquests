sub EVENT_SPAWN {
	quest::settimer(1,3600);
}

sub EVENT_TIMER {
	quest::depop();
}