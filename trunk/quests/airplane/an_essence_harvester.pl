sub EVENT_DEATH_COMPLETE {
	# on death of Eternal Spirit, two a soul harvester spawn
	my $add1 = quest::spawn2(71110,0,0,$x+10,$y,$z,$h);
	my $add2 = quest::spawn2(71110,0,0,$x-10,$y,$z,$h);
	$entity_list->GetMobByID($add1)->AddToHateList($client);
	$entity_list->GetMobByID($add2)->AddToHateList($client);
}