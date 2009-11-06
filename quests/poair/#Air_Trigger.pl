sub EVENT_SPAWN 
{
	$counter = 0;
}

sub EVENT_SIGNAL 
{	
	if ($signal == 1 && defined($qglobals{event_start}) && !defined($qglobals{wind_done})) 
	{
        	$counter=0;
    		quest::spawn2(215446,0,0,-393.8,-673.7,105.3,242.2);
        	quest::spawn2(215446,0,0,-318.5,-637.7,105.4,242.5);
        	quest::spawn2(215446,0,0,-381.7,-567.2,110.0,240.0);
     	}
     	elsif ($signal == 2 && defined($qglobals{event_start}) && !defined($qglobals{wind_done})) 
     	{
     		$counter+=1;

     		if ($counter == 3) 
     		{
     	   		quest::spawn2(215449,0,0,-531.2,-552.3,105.1,255.0);
     	   		quest::spawn2(215449,0,0,-624.9,-651.1,109.1,169.0);
     	   		quest::spawn2(215448,0,0,-566.2,-836.3,105.1,13.2);
     	   		quest::spawn2(215449,0,0,-287.6,-882.7,107.0,249.9);
     	   		quest::spawn2(215449,0,0,-158.1,-560.4,105.1,216.9);
           		$counter=0;
     		}
     	}
     	elsif ($signal == 3 && defined($qglobals{event_start}) && !defined($qglobals{wind_done})) 
     	{
           	quest::depop(215057);
     	   	quest::spawn2(215451,0,0,-1589.9,484.5,15.1,190.6);
     	}
     	elsif ($signal == 4 && !defined($qglobals{wind_done})) 
	{
        	quest::setglobal("wind_done",1,3,"D2");
     	}
	elsif ($signal == 5 && !defined($qglobals{event_start}) && !defined($qglobals{wind_done})) 
	{	
		#A_Mischievous_Stormrider, A_Fearsome_Stormrider, A_Stormrider_Lightningclaw, A_Marauding_Stormrider
		if(!$entity_list->GetMobByNpcTypeID(215002) && !$entity_list->GetMobByNpcTypeID(215014) && !$entity_list->GetMobByNpcTypeID(215013) && !$entity_list->GetMobByNpcTypeID(215065)) 
		{ 
			quest::spawn2(215447,0,0,-376,-628,105,0); 
			quest::setglobal("event_start",1,3,"H2");
		}
	}
}