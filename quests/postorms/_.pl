sub EVENT_SPAWN {
	quest::settimer(1,10);
}

sub EVENT_TIMER {
	if ($timer == 1) {
		$npc->SetAppearance(3);
		quest::stoptimer(1);
	}
}

#Force corpses at the zone-in to appear dead. Adapted from the same script in PoTactics, credit to whoever.

#Submitted by Jim Mills