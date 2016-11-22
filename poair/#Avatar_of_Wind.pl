sub EVENT_SPAWN {
quest::settimer(35,2700);
quest::shout("I will certainly make sure that no mortal is allowed to defile this sacred realm!");
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
