sub EVENT_SPAWN {
	quest::shout("Casper, the friendly ghost. The friendliest ghost you know...");
}

sub EVENT_DEATH {
	quest::shout("That wasn't very friendly...");
	quest::spawn2(63103,0,0,-65,703,11.7,0);
}