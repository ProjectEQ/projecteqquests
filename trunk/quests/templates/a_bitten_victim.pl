sub EVENT_SPAWN {
	my $range = 11;
	my $minimum = 1;
	my $random_race = int(rand($range)) + $minimum;
	
	quest::npcrace($random_race);
	quest::settimer(1,1);
}

sub EVENT_TIMER {
	if ($timer == 1) {
		$npc->SetAppearance(3);
		quest::stoptimer(1);
	}
}
