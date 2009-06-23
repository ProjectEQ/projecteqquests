sub EVENT_SPAWN {
		quest::SetRunning(1);
		quest::settimer("stamboars",1);
}

sub EVENT_TIMER {
	if ($x == 1202 && $y == -351){
		quest::stoptimer("stamboars");
		quest::spawn_condition(potactics,1,0);
		quest::depopall(214097);
	}
}
