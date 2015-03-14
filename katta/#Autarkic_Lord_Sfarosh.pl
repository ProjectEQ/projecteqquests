sub EVENT_SPAWN {
	quest::settimer(1,740);
}

sub EVENT_TIMER {
	quest::depop();
}