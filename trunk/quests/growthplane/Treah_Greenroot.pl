# Call sylvan mobs to attack $client on aggro of Treah_Greenroot

sub EVENT_SPAWN {
	quest::setnexthpevent(50);
}

sub EVENT_AGGRO {
	my $sylvan_mob = $entity_list->GetMobByNpcTypeID(127053);
	my $sylvan2_mob = $entity_list->GetMobByNpcTypeID(127054);
 
	if ($sylvan_mob) {
		my $sylvan_mobnpc = $sylvan_mob->CastToNPC();
		$sylvan_mobnpc->AddToHateList($client, 1);
	}
	if ($sylvan2_mob) {
		my $sylvan2_mobnpc = $sylvan2_mob->CastToNPC();
		$sylvan2_mobnpc->AddToHateList($client, 1);
	}
}

sub EVENT_HP {
	my $sylvan3_mob = $entity_list->GetMobByNpcTypeID(127055);
	my $sylvan4_mob = $entity_list->GetMobByNpcTypeID(127056);
	my $sylvan5_mob = $entity_list->GetMobByNpcTypeID(127061);

	if($hpevent == 50) {
		if ($sylvan3_mob) {
			my $sylvan3_mobnpc = $sylvan3_mob->CastToNPC();
			$sylvan3_mobnpc->AddToHateList($client, 1);
		}
		if ($sylvan4_mob) {
			my $sylvan4_mobnpc = $sylvan4_mob->CastToNPC();
			$sylvan4_mobnpc->AddToHateList($client, 1);
		}
		quest::setnexthpevent(20);
	}
	if($hpevent == 20) {
		if ($sylvan5_mob) {
			my $sylvan5_mobnpc = $sylvan5_mob->CastToNPC();
			$sylvan5_mobnpc->AddToHateList($client, 1);
		}
	}
}

# EOF zone: growthplane ID: 127021 NPC: Treah_Greenroot

