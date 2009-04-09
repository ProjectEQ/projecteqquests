sub EVENT_SPAWN {
	quest::shout("I'm dark and mysterious, with low self esteem. The way I dress makes every day feel like Halloween");
}

sub EVENT_DEATH {
	quest::shout("Ah! My eye! My only weakness!");
	quest::spawn2(63106,0,0,-274,502,15.1,66.6);
}