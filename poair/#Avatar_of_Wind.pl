sub EVENT_SPAWN {
quest::settimer(35,2700);
quest::shout("How dare you!");
}

sub EVENT_TIMER {
if($timer == 35) {
	quest::stoptimer(35);
	quest::depop();
	}
}

sub EVENT_DEATH_COMPLETE {
    quest::signalwith(215450,4,1);
}
