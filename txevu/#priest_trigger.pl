# #priest_trigger (297212) Used in High Priest Nkosi Bakari event.

my $counter;
my $priest;

sub EVENT_SPAWN {
	quest::spawn_condition("txevu", 1, 1); #enable Vrex_Invoker Spawns
	quest::spawn2(297072,0,0,-720, 346, -475.8, 133); #restless_wraith
	$counter = 0;
}

sub EVENT_SIGNAL {
	if($signal == 1) { #shade reached last waypoint
		$counter += 1;
		if($counter == 5) {
			quest::depopall(297072); #restless_wraith
			quest::spawn2(297218,0,0,-720, 346, -475.8, 133); #High_Priest_Nkosi_Bakari
			quest::spawn_condition("txevu", 1, 0);
			$priest = $entity_list->GetNPCByNPCTypeID(297218);
		}
	} elsif($signal == 2) { #High Priest engaged
		quest::settimer("hp_check",5);
	} elsif($signal == 4) { #High Priest lost aggro
		quest::stoptimer("hp_check");
	} elsif($signal == 5) {
		quest::depop_withtimer();
	}
}

sub EVENT_TIMER {
	if($timer eq "hp_check") {
		$currenthp = $priest->GetHP();
		#Each time High Priest reaches 50% he absorbs the next Shade and returns to MaxHP
		if($priest->GetHP() < ($priest->GetMaxHP() / 2)) {
			if($entity_list->IsMobSpawnedByNpcTypeID(297213)) {
				quest::signalwith(297213,3);
				$priest->SetHP($priest->GetMaxHP());
			} elsif ($entity_list->IsMobSpawnedByNpcTypeID(297214)) {
				quest::signalwith(297214,3);
				$priest->SetHP($priest->GetMaxHP());
			} elsif ($entity_list->IsMobSpawnedByNpcTypeID(297215)) {
				quest::signalwith(297215,3);
				$priest->SetHP($priest->GetMaxHP());
			} elsif ($entity_list->IsMobSpawnedByNpcTypeID(297216)) {
				quest::signalwith(297216,3);
				$priest->SetHP($priest->GetMaxHP());
			} elsif ($entity_list->IsMobSpawnedByNpcTypeID(297217)) {
				quest::signalwith(297217,3);
				$priest->SetHP($priest->GetMaxHP());
			} else {
				quest::stoptimer("hp_check");
			}
		}
	}
}