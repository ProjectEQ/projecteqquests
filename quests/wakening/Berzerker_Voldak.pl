sub EVENT_SPAWN {
	quest::settimer("onset1",58);
}

sub EVENT_TIMER {
	if($timer=="onset1") {
		quest::moveto(-4311,-720,-183,-1,1);
		quest::stoptimer("onset1");
	}
}

sub EVENT_SIGNAL {
	if($signal == 1) {
		quest::start(24);
		quest::signalwith(119168,1,300);
	}
	if($signal == 2) {
		quest::say("Woah! we're being ambushed!!");
		quest::signalwith(119168,2,300);
	}
}



