sub EVENT_SPAWN {
		quest::SetRunning(1);
		quest::settimer("stampig",1);
}

sub EVENT_TIMER {
	if ($x == 1202 && $y == -351) {
		quest::stoptimer("stampig");
		quest::depop();
	}
}
