sub EVENT_SPAWN {
	quest::shout("Brains....");
}

sub EVENT_DEATH_COMPLETE {
	quest::shout("Braaaains...");
	quest::spawn2(63104,0,0,65,531,19.1,352.4); # NPC: Eviler_Brain_Eater
}
