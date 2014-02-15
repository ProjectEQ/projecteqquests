# #Ixt_Hsek_Syat (297211)


sub EVENT_SIGNAL {
	#Champion is at 15%, need to assist
	my $rClient = $entity_list->GetRandomClient($x,$y,$z, 250);
	if ($rClient) {
		quest::attack($rClient->GetName());
	}
}