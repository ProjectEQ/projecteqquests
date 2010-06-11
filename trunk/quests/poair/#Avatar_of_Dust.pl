sub EVENT_SPAWN {
quest::settimer(45,4500);
quest::shout("How dare you!");
}

sub EVENT_TIMER {
if($timer == 45) {
	quest::stoptimer(45);
	quest::depop;
	}
}

sub EVENT_DEATH {
    quest::signalwith(215461,4,1);
}
