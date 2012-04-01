# this mob instantly spawn the enraged relative on death 


sub EVENT_COMBAT {
	if($combat_state=1) {
		quest::say("Areeeeewwwww");
	}
}

sub EVENT_DEATH {
    $spawnenraged = quest::spawn2(111143,0,0,$x,$y,$z,0);
    $attack = $entity_list->GetMobID($spawnenraged);
    $enragedattack = $attack->CastToNPC();
    $enragedattack->AddToHateList($client, 1);
}

