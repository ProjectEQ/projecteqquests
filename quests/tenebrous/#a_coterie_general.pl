sub EVENT_SPAWN {
	quest::settimer(1,300);
}

sub EVENT_TIMER {
	quest::depop();
}
