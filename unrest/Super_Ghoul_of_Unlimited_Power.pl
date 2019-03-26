sub EVENT_SPAWN {
	quest::shout("HAHAHA! PUNY MORTALS! YOU SHALL ALL TASTE MY WRATH NOW!!");
}

sub EVENT_DEATH_COMPLETE {
	quest::shout("He's heeeere....");
	quest::spawn2(63108,0,0,33,384,3.1,137.8); # NPC: Tiny_Jack
}
