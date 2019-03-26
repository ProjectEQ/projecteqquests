sub EVENT_SPAWN {
	quest::shout("Now you didn't think we'd make this easy and have everyone outside did you? This time you'll have to go IN the haunted house!");
}

sub EVENT_DEATH_COMPLETE {
	quest::shout("Oh, I've wasted my life");
	quest::spawn2(63102,0,0,68,493,5.1,425); # NPC: Casper
}
