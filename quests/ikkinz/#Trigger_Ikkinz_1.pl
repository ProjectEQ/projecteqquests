sub EVENT_SIGNAL {
	if($signal == 1) {
		quest::settimer(1,10);
	} elsif($signal == 2) {
		quest::settimer(2,10);
	}
}

sub EVENT_TIMER {
	if($timer == 1) {
		if(!$entity_list->GetMobByNpcTypeID(294574) && !$entity_list->GetMobByNpcTypeID(294338)) { #Priest of Righteousness
			quest::stoptimer(1);
			$entity_list->FindDoor(2)->SetLockPick(0);
			$entity_list->FindDoor(3)->SetLockPick(0);
			$entity_list->FindDoor(4)->SetLockPick(0);
			$entity_list->FindDoor(5)->SetLockPick(0);
		}
    } elsif($timer == 2) {
		if(!$entity_list->GetMobByNpcTypeID(294339) && !$entity_list->GetMobByNpcTypeID(294575)) { #Defender of Righteousness
			quest::stoptimer(2);
			$entity_list->FindDoor(6)->SetLockPick(0);
			$entity_list->FindDoor(7)->SetLockPick(0);
		}
    }
}