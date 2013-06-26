sub EVENT_SPAWN {
quest::settimer(36,4500);
quest::shout("How dare you!");
}

sub EVENT_TIMER {
if($timer == 36) {
	quest::stoptimer(36);
	quest::depop();
	}
}

sub EVENT_DEATH {
    quest::signalwith(215453,3,1);
}
