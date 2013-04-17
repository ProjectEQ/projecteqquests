sub EVENT_SPAWN 
{
	$counter = 0;
}    

sub EVENT_SIGNAL 
{
	if ($signal == 1 && defined($qglobals{mist_event_start}) && !defined($qglobals{mist_done})) 
	{
     		$counter+=1;
     
     		if ($counter == 4) 
     		{
			quest::spawn2(215070,0,0,323.7,-721.3,439.3,82.9);
        	}
     	}
     	elsif ($signal == 2 && defined($qglobals{mist_event_start}) && !defined($qglobals{mist_done})) 
     	{
        	quest::spawn2(215071,0,0,-1571.6,-570.0,343.6,190.9);
		quest::depop_withtimer(215023);
     	}
     	elsif ($signal == 3  && !defined($qglobals{mist_done})) 
     	{
        	quest::setglobal("mist_done",1,3,"F");
     	}
	elsif ($signal == 4 && !defined($qglobals{mist_event_start}) && !defined($qglobals{mist_done})) 
	{
		#A_Phoenix_Breezewing, A_Wind_Pheonix X2, Servitor_of_Xegony, Spiritfrenzied_Phoenix, Ardent_Phoenix_of_Xegony, A_Phoenix_Searedwing, Calebgrothiel
		if(!$entity_list->GetMobByNpcTypeID(215058) && !$entity_list->GetMobByNpcTypeID(215026) && !$entity_list->GetMobByNpcTypeID(215025) && !$entity_list->GetMobByNpcTypeID(215027) && !$entity_list->GetMobByNpcTypeID(215062) && !$entity_list->GetMobByNpcTypeID(215059) && !$entity_list->GetMobByNpcTypeID(215028) && !$entity_list->GetMobByNpcTypeID(215061)) 
		{
			quest::spawn2(215069,0,0,304.2,-792.2,441.6,15.2); 
			quest::spawn2(215069,0,0,348.4,-632.2,442.3,140.1);
			quest::spawn2(215069,0,0,391.7,-736.2,438.1,203.4);
			quest::spawn2(215069,0,0,260,-699.8,444.5,75.5);
			quest::setglobal("mist_event_start",1,3,"H2");
			$counter=0;
		}
	}
	elsif ($signal == 5)
	{
		quest::delglobal("mist_done");
	}
}