sub EVENT_SPAWN {
		quest::SetRunning(1);
		quest::settimer("stamboar",1);
}

sub EVENT_TIMER {
	if ($x == 1202 && $y == -351) {
		quest::depopall(214097);
		quest::stoptimer("stamboar");
		quest::signal(214124);
		quest::depop();
	}
}
