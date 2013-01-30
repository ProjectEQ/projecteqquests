my $raid = undef;
my $group = undef;
my $pc = undef;
my $count = undef;

sub EVENT_ATTACK {
	$raid = $entity_list->GetRaidByClient($client);
	$group = $entity_list->GetGroupByClient($client);
	if ($raid) {
		for ($count = 0; $count < $raid->RaidCount(); $count++) {
			$pc = $raid->GetMember($count);
			#distance restriction so the members need to be reasonably close.
			if ($pc->CalculateDistance($npc->GetX(),$npc->GetY(),$npc->GetZ()) <= 100) {
				$pc->MovePC(207,-1094,910,-746,0);
			}
		}
	}
	elsif ($group) {
		for ($count = 0; $count < $group->GroupCount(); $count++) {
			$pc = $group->GetMember($count);
			#distance restriction so the members need to be reasonably close.
			if ($pc->CalculateDistance($npc->GetX(),$npc->GetY(),$npc->GetZ()) <= 100) {
				$pc->MovePC(207,-1094,910,-746,0);
			}
		}
	}
	else {
		#If player is not grouped or in raid, just move the one.
		quest::movepc(207,-1094,910,-746);
	}
	# 207031 (An Unimaginable Horror) will depop after 30 minutes.
	$client->Message(15,"You have 30 minutes");
	#signal mouth_trigger that spawns all the mobs in stomach
	quest::signal(207071);
	quest::depop_withtimer();
	#update spawn timer after depop or mob will repop when zone resets
	#quest::updatespawntimer(42246,172800000); #no variance
	quest::updatespawntimer(42246,(int(rand(34560))+155520)*1000); #respawn with variance
}
