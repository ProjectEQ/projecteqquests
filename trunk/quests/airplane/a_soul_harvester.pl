sub EVENT_DEATH_COMPLETE {
	# on death of soul harvester one a_soul tamer spawn
	my $add1 = quest::spawn2(71100,0,0,$x+10,$y,$z,$h);
	$entity_list->GetMobByID($add1)->AddToHateList($client);
}