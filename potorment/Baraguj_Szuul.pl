
sub EVENT_COMBAT {
	my @clientlist = $entity_list->GetClientList();
	foreach $ent (@clientlist) {
		#distance restriction so the members need to be reasonably close.
		if ($ent->CalculateDistance($npc->GetX(),$npc->GetY(),$npc->GetZ()) <= 100) {
		$ent->MovePC(207,-1094,910,-746,0);
		}
	}
	#signal mouth_trigger that spawns all the mobs in stomach
	quest::signal(207071);
	quest::settimer(1,5);
}

sub EVENT_TIMER {
	quest::depop_withtimer();
}