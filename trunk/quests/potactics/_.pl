sub EVENT_SPAWN {
	quest::settimer(1,10);
}

sub EVENT_TIMER {
	if ($timer == 1) {
		$npc->SetAppearance(3);
		quest::stoptimer(1);
	}
}

# corpse in the pit in PoTactics