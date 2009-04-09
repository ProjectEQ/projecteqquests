sub EVENT_SPAWN {
quest::settimer(37,2700);
quest::shout("How dare you!");
}

sub EVENT_TIMER {
if($timer == 37) {
	quest::stoptimer(37);
	quest::depop;
	}
}

sub EVENT_AGGRO {
quest::stoptimer(37);
quest::settimer(37, 1800);
}

sub EVENT_DEATH {
    quest::signalwith(215455,3,1);
}
