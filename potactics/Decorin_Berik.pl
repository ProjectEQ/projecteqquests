#spawn Vallon Zek
sub EVENT_DEATH_COMPLETE {
$trigger_up = $entity_list->GetMobByNpcTypeID(214123); 
	
	if ($trigger_up) {
		quest::signalwith(214123, 214056, 0); # NPC: #rallos_trigger
	}
}
       

sub EVENT_SIGNAL {
        #event time expired, depop with respawn timer.
        quest::depop_withtimer();
}

sub EVENT_SPAWN {
	$entity_list->FindDoor(14)->SetLockPick(1);
	$entity_list->FindDoor(15)->SetLockPick(1);
}

# End of File  Zone: PoTactics  ID: 214056 -- Decorin_Berik
