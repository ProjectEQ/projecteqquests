# The Great Pumpkin
# lvl 70 boss

sub EVENT_SPAWN {
	quest::shout("Muahaha!");
	quest::pathto(-782,-1319,-43);
}

sub EVENT_DEATH_COMPLETE {
	quest::say("DAMN YOU CHARLIE BROWN! YOU RATTED ME OUT!");
	quest::signalwith(20260,6);
}