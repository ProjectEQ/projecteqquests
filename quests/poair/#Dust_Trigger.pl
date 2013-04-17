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
    		if (!defined($qglobals{dust_event_start}) && !defined($qglobals{dust_done}) && !$entity_list->GetMobByNpcTypeID(215043) && !$entity_list->GetMobByNpcTypeID(215044) && !$entity_list->GetMobByNpcTypeID(215045) && !$entity_list->GetMobByNpcTypeID(215060)) 
    		{
			quest::spawn2(215460,0,0,-356.8,591.3,436.3,209.4); 
			quest::spawn2(215460,0,0,-282.1,663.4,442.4,229.8); 
			quest::spawn2(215460,0,0,-168.5,782.1,434.2,170.2); 
			quest::spawn2(215460,0,0,-301.7,832.8,433.6,134.8); 
			quest::spawn2(215460,0,0,-505.8,892.7,434.7,125.4); 
			quest::spawn2(215460,0,0,-611.5,782.7,434.9,61.6); 
			quest::spawn2(215460,0,0,-641.2,608.2,439.1,40.2); 
			quest::spawn2(215460,0,0,-562.6,493.1,436.8,24.9); 
			quest::spawn2(215460,0,0,-343.5,476.7,433.6,244.5); 
			quest::spawn2(215460,0,0,-220.8,528.4,433.6,219.1); 
			quest::spawn2(215460,0,0,-160.8,609.6,435,206.9); 
			quest::spawn2(215460,0,0,-435.5,773.5,434.1,119.6); 
			quest::spawn2(215460,0,0,-531.9,689.2,444,89); 
			quest::spawn2(215460,0,0,-363.4,747.4,435.2,155.4); 
			quest::spawn2(215460,0,0,-480.3,574,435.6,18.8); 
			quest::spawn2(215456,0,0,-443.7,642.6,435.1,58.8); 
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
        		quest::spawn2(215042,0,0,-400,850.8,433.6,129.4); #Sigi
        	}
     		elsif ($counter == 2) 
     		{
        		quest::spawn2(215459,0,0,-354.8,665.4,433.6,181.4); #spawn
        		quest::spawn2(215459,0,0,-464.2,761.8,433.6,122.2); #spawn
        		quest::spawn2(215459,0,0,-434.1,548.7,439.6,248.5); #spawn
        	}
     		elsif ($counter == 1) 
     		{
        		quest::spawn2(215459,0,0,-354.8,665.4,433.6,181.4); #spawn
        		quest::spawn2(215459,0,0,-464.2,761.8,433.6,122.2); #spawn
        		quest::spawn2(215459,0,0,-434.1,548.7,439.6,248.5); #spawn
        	}
     	}	
     	elsif ($signal == 2 && defined($qglobals{dust_event_start}) && !defined($qglobals{dust_done})) 
     	{
		$counterone+=1;
		
     		if ($counterone == 3) 
     		{
			quest::spawn2(215456,0,0,-449.4,641.1,435.2,49.5); #Archwalker
			$counterone=0;
        	}
     	}
     	elsif ($signal == 3 && defined($qglobals{dust_event_start}) && !defined($qglobals{dust_done})) 
     	{
		quest::spawn2(215475,0,0,1671,527,356,192);
		quest::depop_withtimer(215046);
	}
     	elsif ($signal == 4  && !defined($qglobals{dust_done})) 
     	{
     		quest::setglobal("dust_done",1,3,"F");
     	}
     	elsif ($signal == 5 && !defined($qglobals{dust_event_start}) && !defined($qglobals{dust_done})) 
     	{
     		#A_Crystalline_Windwalker, A_Pristine_Recluse, A_Vorladien_Webspinner, Lossenmachar
     		if(!$entity_list->GetMobByNpcTypeID(215043) && !$entity_list->GetMobByNpcTypeID(215044) && !$entity_list->GetMobByNpcTypeID(215045) && !$entity_list->GetMobByNpcTypeID(215060))
     		{
			quest::spawn2(215460,0,0,-356.8,591.3,436.3,209.4); 
			quest::spawn2(215460,0,0,-282.1,663.4,442.4,229.8); 
			quest::spawn2(215460,0,0,-168.5,782.1,434.2,170.2); 
			quest::spawn2(215460,0,0,-301.7,832.8,433.6,134.8); 
			quest::spawn2(215460,0,0,-505.8,892.7,434.7,125.4); 
			quest::spawn2(215460,0,0,-611.5,782.7,434.9,61.6); 
			quest::spawn2(215460,0,0,-641.2,608.2,439.1,40.2); 
			quest::spawn2(215460,0,0,-562.6,493.1,436.8,24.9); 
			quest::spawn2(215460,0,0,-343.5,476.7,433.6,244.5); 
			quest::spawn2(215460,0,0,-220.8,528.4,433.6,219.1); 
			quest::spawn2(215460,0,0,-160.8,609.6,435,206.9); 
			quest::spawn2(215460,0,0,-435.5,773.5,434.1,119.6); 
			quest::spawn2(215460,0,0,-531.9,689.2,444,89); 
			quest::spawn2(215460,0,0,-363.4,747.4,435.2,155.4); 
			quest::spawn2(215460,0,0,-480.3,574,435.6,18.8); 
			quest::spawn2(215456,0,0,-443.7,642.6,435.1,58.8); 
			quest::setglobal("dust_event_start",1,3,"H2");
			$counter=0;
		}
		elsif ($signal == 6)
		{
		    quest::delglobal("dust_done");
		}
	}
}
