sub EVENT_SPAWN {
	quest::shout("I'm a good zombie...a good zombie...");
}

sub EVENT_DEATH {
	quest::shout("Ok, I deserved that");
	quest::spawn2(63107,0,0,1,151,3.1,0);
}