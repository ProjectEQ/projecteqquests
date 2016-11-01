sub EVENT_SPAWN {
quest::settimer(45,2700);
quest::shout("Elements of Air and Dust I call upon you to aid me in the defense of this land!");
}

sub EVENT_TIMER {
if($timer == 45) {
	quest::stoptimer(45);
	quest::depop();
	}
}

sub EVENT_DEATH_COMPLETE {
    quest::signalwith(215461,4,1);
}
