sub EVENT_SPAWN {
	quest::settimer("onset2",55);
}

sub EVENT_TIMER {
	if($timer=="onset") {
		quest::moveto(-4310,-741,-183,-1,1);
		quest::stoptimer("onset2");
	}
}

sub EVENT_SIGNAL {
	if($signal == 1) {
		quest::start(25);
	}
}



