# items: 31758
sub EVENT_ITEM{
	my $sentinel1 = $entity_list->GetNPCByNPCTypeID(160129); #Frieza
	my $sentinel2 = $entity_list->GetNPCByNPCTypeID(160130); #Tozza
	if(plugin::check_handin(\%itemcount, 31758 => 1)){
		quest::spawn2(160470,0,0,$x,$y,6,256); #an_imprisoned_shade
		quest::signalwith(160129,1); #Signal Private_Sentinel_Frieza
		$sentinel1->AddToHateList($client, 1);
		quest::signalwith(160130,1); #Signal Private_Sentinel_Tozza
		$sentinel2->AddToHateList($client, 1);
	}
	plugin::return_items(\%itemcount);
}
