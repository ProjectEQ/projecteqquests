sub EVENT_SPAWN {
	quest::shout("More brains!");
}

sub EVENT_DEATH_COMPLETE {
	quest::shout("Not MY brains!");
	quest::spawn2(63105,0,0,-75,700,55.1,128.8); # NPC: Evilerer_Brain_Eater
}
