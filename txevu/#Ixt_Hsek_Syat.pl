# #Ixt_Hsek_Syat (297211)


sub EVENT_SIGNAL {
	#Champion is at 15%, need to assist
	my $champion = $entity_list->GetNPCByNPCTypeID(297034);
	my $TopHate = $champion->GetHateTop();
	my $attack_name = $entity_list->GetClientByName($TopHate->GetName());
	quest::attack($attack_name->GetName());
}