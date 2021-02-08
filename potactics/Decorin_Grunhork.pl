#Spawn Tallon Zek
sub EVENT_DEATH_COMPLETE {
$trigger_up = $entity_list->GetMobByNpcTypeID(214123); 
	
	if ($trigger_up) {
		quest::signalwith(214123, 214057, 0); # NPC: #rallos_trigger
	}
}
       

sub EVENT_SIGNAL {
        #event time expired, depop with respawn timer.
        quest::depop_withtimer();
}

sub EVENT_SPAWN {
	$entity_list->FindDoor(16)->SetLockPick(1);
	$entity_list->FindDoor(17)->SetLockPick(1);
}
