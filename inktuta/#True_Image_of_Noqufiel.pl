# #True_Image_of_Noqufiel (296065)

my $instid;

sub EVENT_SPAWN {
	#Lets try not to get stuck in a wall
	my $rlos = $entity_list->GetRandomClient(-72,-663,-128,160);
	if($rlos && !$npc->CheckLoS($rlos)) {
		$npc->GMMove(20,-633, -126,125);
	}
}

sub EVENT_AGGRO {
	$instid = quest::GetInstanceID("inktuta",0);
	quest::signalwith(296075,1); #tell trigger I'm aggro'd
}

sub EVENT_SIGNAL {
	if ($signal == 4) { #from trigger saying banish
		my $TopHate = $npc->GetHateTop();
		if ($TopHate) {
			quest::say("Begone " . $TopHate->GetName());
			$npc->SetHate($TopHate,1,1);
			my $MoveName = $entity_list->GetClientByName($TopHate->GetName());
			$MoveName->MovePCInstance(296, $instid, -117, -912, -127, 64);
		}
	}
}

sub EVENT_DEATH_COMPLETE {
	quest::say("This is but a temporary setback. I will return.");
	quest::signalwith(296070,296065); #tell zone_status I died
}
