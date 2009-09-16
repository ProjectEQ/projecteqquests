sub EVENT_SPAWN {
	my $minimum = 1;
	my $random_race = int(rand(12)) + $minimum;
	my $random_gender = int(rand(2));
	
	quest::npcgender($random_gender);
	quest::npcrace($random_race);
	quest::settimer(1,1);
}

sub EVENT_TIMER {
	if ($timer == 1) {
		$npc->SetAppearance(3);
		quest::stoptimer(1);
	}
}
