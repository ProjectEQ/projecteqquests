sub EVENT_SPAWN {
	quest::settimer(1,120);
}

sub EVENT_TIMER {
	quest::depop();
}

