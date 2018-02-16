sub EVENT_SPAWN {
	quest::settimer("onset3",90);
}

sub EVENT_TIMER {
	if($timer=="onset3") {
		quest::moveto(-4357,-715,-183,-2,1);
		quest::stoptimer("onset3");
	}
}

sub EVENT_SIGNAL {
	if($signal == 1) {
		quest::start(26);
	}
}

