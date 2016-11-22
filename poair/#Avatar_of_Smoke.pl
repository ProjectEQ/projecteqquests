sub EVENT_SPAWN {
quest::settimer(36,2700);
quest::shout("The time has come for all intruders to be tested! I will not allow you to pillage this plane any longer!");
}

sub EVENT_TIMER {
if($timer == 36) {
	quest::stoptimer(36);
	quest::depop();
	}
}

sub EVENT_DEATH_COMPLETE {
    quest::signalwith(215453,3,1);
}
