sub EVENT_SPAWN {
	my $random_race = quest::ChooseRandom(1,2,3,4,5,6,7,8,9,10,11,12,128,130,330);
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
