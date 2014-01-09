##An_Unimaginable_Horror (207031)

sub EVENT_SPAWN {
	quest::settimer(2,1800); #fail timer; 30 minutes
}

sub EVENT_TIMER {
	if($timer == 2) {
		quest::depop();
	}
}

sub EVENT_DEATH_COMPLETE {
	quest::spawn2(207082,0,0,1,-1021,-27,0); #Real #Baraguj_Szuul
	my @clientlist = $entity_list->GetClientList();
	foreach $ent (@clientlist) {
		#distance restriction so the members need to be reasonably close.
		if ($ent->CalculateDistance($npc->GetX(),$npc->GetY(),$npc->GetZ()) <= 200) {
		$ent->MovePC(207,1,-890,-27,180); #back to Baraguj_Szuul
		}
	}
}
