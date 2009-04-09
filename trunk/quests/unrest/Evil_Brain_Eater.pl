sub EVENT_SPAWN {
	quest::shout("Brains....");
}

sub EVENT_DEATH {
	quest::shout("Braaaains...");
	quest::spawn2(63104,0,0,65,531,19.1,176.2);
}