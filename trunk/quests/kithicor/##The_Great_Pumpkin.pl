# The Great Pumpkin
# lvl 70 boss

sub EVENT_SPAWN {
	quest::shout("Muahaha!");
	quest::pathto(-782,-1319,-43);
}

sub EVENT_DEATH {
	quest::say("DAMN YOU CHARLIE BROWN! YOU RATTED ME OUT!");
	quest::signal(20260,0);
}