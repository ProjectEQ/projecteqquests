sub EVENT_SPAWN {
quest::settimer(37,4500);
quest::shout("How dare you!");
}

sub EVENT_TIMER {
if($timer == 37) {
	quest::stoptimer(37);
	quest::depop();
	}
}

sub EVENT_DEATH_COMPLETE {
    quest::signalwith(215455,3,1);
}
