sub EVENT_SPAWN {
quest::settimer(35,2700);
quest::shout("How dare you!");
}

sub EVENT_TIMER {
if($timer == 35) {
	quest::stoptimer(35);
	quest::depop;
	}
}

sub EVENT_AGGRO {
quest::stoptimer(35);
quest::settimer(35, 1800);
}

sub EVENT_DEATH {
    quest::signalwith(215450,4,1);
}
