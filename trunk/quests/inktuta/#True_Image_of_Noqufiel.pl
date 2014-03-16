# #True_Image_of_Noqufiel (296065)

my $instid;

sub EVENT_AGGRO {
	$instid = quest::GetInstanceID("inktuta",0);
	quest::signalwith(296075,1); #tell trigger I'm aggro'd
}

sub EVENT_SIGNAL {
	if ($signal == 4) { #from trigger saying banish
		my $TopHate = $npc->GetHateTop();
		quest::say("Begone " . $TopHate->GetName());
		$npc->SetHate($TopHate,1,1);
		my $MoveName = $entity_list->GetClientByName($TopHate->GetName());
		$MoveName->MovePCInstance(296, $instid, -62, -826, -126, 0);
	}
}

sub EVENT_DEATH_COMPLETE {
	quest::say("This is but a temporary setback. I will return.");
	quest::signalwith(296070,296065); #tell zone_status I died
}
