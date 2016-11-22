sub EVENT_SPAWN {
quest::settimer(37,2700);
quest::shout("Leave now foolish mortal you have begun to send events in motion that you cannot possibly understand!");
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
