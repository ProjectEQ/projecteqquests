sub EVENT_SPAWN {
        quest::delglobal(coirnav_done);
        quest::say("boo!");

}

sub EVENT_DEATH {

	quest::signalwith(216107,1,0);

}

