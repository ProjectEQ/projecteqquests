sub EVENT_DEATH_COMPLETE {
	# send a signal to the Key_Master
	quest::signalwith(71056,2,200000);
	# on death of soul carrier two a essence carrier spawn
	my $add1 = quest::spawn2(71070,0,0,$x+10,$y,$z,$h);
	my $add2 = quest::spawn2(71070,0,0,$x-10,$y,$z,$h);
	$entity_list->GetMobByID($add1)->AddToHateList($client);
	$entity_list->GetMobByID($add2)->AddToHateList($client);
}