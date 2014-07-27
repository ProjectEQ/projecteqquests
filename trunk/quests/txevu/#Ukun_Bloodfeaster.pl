sub EVENT_SPAWN {
	quest::spawn_condition("txevu", 2, 1); # a_decaying_corpse
}

sub EVENT_COMBAT {
	if ($combat == 1) {
		quest::settimer("stonemites", 30);
		quest::signalwith(297073, 1); #tell all a_decaying_corpse to each spawn 2 stonemites
		quest::stoptimer("reset");
	} elsif ($combat == 0) {
		quest::stoptimer("stonemites");
		quest::settimer("reset", 1200);
	}
}


sub EVENT_TIMER {
	if ($timer eq "stonemites") {
		quest::signalwith(297073, 1); #tell all a_decaying_corpse to each spawn 2 stonemites
	} elsif ($timer eq "reset") {
		quest::depopall(297207); #stonemites
		quest::stoptimer("reset");
	}
}

sub EVENT_DEATH_COMPLETE {
	quest::spawn_condition("txevu", 2, 0); # a_decaying_corpse
}