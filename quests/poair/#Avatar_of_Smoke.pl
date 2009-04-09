sub EVENT_SPAWN {
quest::settimer(36,2700);
quest::shout("How dare you!");
}

sub EVENT_TIMER {
if($timer == 36) {
	quest::stoptimer(36);
	quest::depop;
	}
}

sub EVENT_AGGRO {
quest::stoptimer(36);
quest::settimer(36, 1800);
}

sub EVENT_DEATH {
    quest::signalwith(215453,3,1);
}
