sub EVENT_SPAWN 
{
   $counter = 0;
   $counterone = 0;
   quest::settimer(30,60);
}

sub EVENT_TIMER 
{
	if($timer == 30) {
    		#A_Crystalline_Windwalker
    		if (!defined($qglobals{dust_event_start}) && !defined($qglobals{dust_done}) && !$entity_list->IsMobSpawnedByNpcTypeID(215043) && !$entity_list->IsMobSpawnedByNpcTypeID(215044) && !$entity_list->IsMobSpawnedByNpcTypeID(215045) && !$entity_list->IsMobSpawnedByNpcTypeID(215060)) 
    		{
			quest::spawn2(215460,0,0,-356.8,591.3,436.3,418.8); # NPC: an_erratic_arachnid
			quest::spawn2(215460,0,0,-282.1,663.4,442.4,459.6); # NPC: an_erratic_arachnid
			quest::spawn2(215460,0,0,-168.5,782.1,434.2,340.4); # NPC: an_erratic_arachnid
			quest::spawn2(215460,0,0,-301.7,832.8,433.6,269.6); # NPC: an_erratic_arachnid
			quest::spawn2(215460,0,0,-505.8,892.7,434.7,250.8); # NPC: an_erratic_arachnid
			quest::spawn2(215460,0,0,-611.5,782.7,434.9,123.2); # NPC: an_erratic_arachnid
			quest::spawn2(215460,0,0,-641.2,608.2,439.1,80.4); # NPC: an_erratic_arachnid
			quest::spawn2(215460,0,0,-562.6,493.1,436.8,49.8); # NPC: an_erratic_arachnid
			quest::spawn2(215460,0,0,-343.5,476.7,433.6,489); # NPC: an_erratic_arachnid
			quest::spawn2(215460,0,0,-220.8,528.4,433.6,438.2); # NPC: an_erratic_arachnid
			quest::spawn2(215460,0,0,-160.8,609.6,435,413.8); # NPC: an_erratic_arachnid
			quest::spawn2(215460,0,0,-435.5,773.5,434.1,239.2); # NPC: an_erratic_arachnid
			quest::spawn2(215460,0,0,-531.9,689.2,444,178); # NPC: an_erratic_arachnid
			quest::spawn2(215460,0,0,-363.4,747.4,435.2,310.8); # NPC: an_erratic_arachnid
			quest::spawn2(215460,0,0,-480.3,574,435.6,37.6); # NPC: an_erratic_arachnid
			quest::spawn2(215456,0,0,-443.7,642.6,435.1,117.6); # NPC: A_Vorladien_Archwalker
			quest::setglobal("dust_event_start",1,3,"H2");
			$counter=0;
		}
	}
}	
		
sub EVENT_SIGNAL 
{
	if ($signal == 1 && defined($qglobals{dust_event_start}) && !defined($qglobals{dust_done})) 
	{
        	$counter+=1;
        	
     		if ($counter == 3) 
     		{
        		quest::spawn2(215042,0,0,-399,907,436.8,258.8); #Sigi
        	}
     		elsif ($counter == 2) 
     		{
        		quest::spawn2(215459,0,0,-354.8,665.4,433.6,362.8); #spawn
        		quest::spawn2(215459,0,0,-464.2,761.8,433.6,244.4); #spawn
        		quest::spawn2(215459,0,0,-434.1,548.7,439.6,497); #spawn
        	}
     		elsif ($counter == 1) 
     		{
        		quest::spawn2(215459,0,0,-354.8,665.4,433.6,362.8); #spawn
        		quest::spawn2(215459,0,0,-464.2,761.8,433.6,244.4); #spawn
        		quest::spawn2(215459,0,0,-434.1,548.7,439.6,497); #spawn
        	}
     	}	
     	elsif ($signal == 2 && defined($qglobals{dust_event_start}) && !defined($qglobals{dust_done})) 
     	{
		$counterone+=1;
		
     		if ($counterone == 3) 
     		{
			quest::spawn2(215456,0,0,-449.4,641.1,435.2,99); #Archwalker
			$counterone=0;
        	}
     	}
     	elsif ($signal == 3 && defined($qglobals{dust_event_start}) && !defined($qglobals{dust_done})) 
     	{
		quest::spawn2(215475,0,0,1671,527,356,384); # NPC: #Avatar_of_Dust
		quest::depop_withtimer(215046);
	}
     	elsif ($signal == 4  && !defined($qglobals{dust_done})) 
     	{
     		quest::setglobal("dust_done",1,3,"F");
     	}
     	elsif ($signal == 5 && !defined($qglobals{dust_event_start}) && !defined($qglobals{dust_done})) 
     	{
     		#A_Crystalline_Windwalker, A_Pristine_Recluse, A_Vorladien_Webspinner, Lossenmachar
     		if(!$entity_list->IsMobSpawnedByNpcTypeID(215043) && !$entity_list->IsMobSpawnedByNpcTypeID(215044) && !$entity_list->IsMobSpawnedByNpcTypeID(215045) && !$entity_list->IsMobSpawnedByNpcTypeID(215060))
     		{
			quest::spawn2(215460,0,0,-356.8,591.3,436.3,418.8); # NPC: an_erratic_arachnid
			quest::spawn2(215460,0,0,-282.1,663.4,442.4,459.6); # NPC: an_erratic_arachnid
			quest::spawn2(215460,0,0,-168.5,782.1,434.2,340.4); # NPC: an_erratic_arachnid
			quest::spawn2(215460,0,0,-301.7,832.8,433.6,269.6); # NPC: an_erratic_arachnid
			quest::spawn2(215460,0,0,-505.8,892.7,434.7,250.8); # NPC: an_erratic_arachnid
			quest::spawn2(215460,0,0,-611.5,782.7,434.9,123.2); # NPC: an_erratic_arachnid
			quest::spawn2(215460,0,0,-641.2,608.2,439.1,80.4); # NPC: an_erratic_arachnid
			quest::spawn2(215460,0,0,-562.6,493.1,436.8,49.8); # NPC: an_erratic_arachnid
			quest::spawn2(215460,0,0,-343.5,476.7,433.6,489); # NPC: an_erratic_arachnid
			quest::spawn2(215460,0,0,-220.8,528.4,433.6,438.2); # NPC: an_erratic_arachnid
			quest::spawn2(215460,0,0,-160.8,609.6,435,413.8); # NPC: an_erratic_arachnid
			quest::spawn2(215460,0,0,-435.5,773.5,434.1,239.2); # NPC: an_erratic_arachnid
			quest::spawn2(215460,0,0,-531.9,689.2,444,178); # NPC: an_erratic_arachnid
			quest::spawn2(215460,0,0,-363.4,747.4,435.2,310.8); # NPC: an_erratic_arachnid
			quest::spawn2(215460,0,0,-480.3,574,435.6,37.6); # NPC: an_erratic_arachnid
			quest::spawn2(215456,0,0,-443.7,642.6,435.1,117.6); # NPC: A_Vorladien_Archwalker
			quest::setglobal("dust_event_start",1,3,"H2");
			$counter=0;
		}
	}
	elsif ($signal == 6)
	{
	    quest::delglobal("dust_done");
	}
}
