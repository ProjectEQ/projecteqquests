#Spawn Tallon Zek
sub EVENT_DEATH_COMPLETE {
        quest::signalwith(214123, 214057, 0);
}

sub EVENT_SIGNAL {
        #event time expired, depop with respawn timer.
        quest::depop_withtimer();
}

sub EVENT_SPAWN {
    $trigger_up = $entity_list->GetMobByNpcTypeID(214123); 
	
	if (!$trigger_up) {
		quest::depop_withtimer();
	} else {
		$entity_list->FindDoor(16)->SetLockPick(1);
		$entity_list->FindDoor(17)->SetLockPick(1);
	}
}

# End of File  Zone: PoTactics  ID: 214057 -- Decorin_Grunhork