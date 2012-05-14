sub EVENT_SPAWN {
	quest::settimer("rest",300);
}

sub EVENT_TIMER {
	if ($timer eq "rest") {
		quest::depop();
	}
}

