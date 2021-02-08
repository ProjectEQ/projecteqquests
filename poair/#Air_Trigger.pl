sub EVENT_SPAWN 
{
	$counter = 0;
}

sub EVENT_SIGNAL 
{	
	if ($signal == 1 && defined($qglobals{event_start}) && !defined($qglobals{wind_done})) 
	{
        	$counter=0;
    		quest::spawn2(215446,0,0,-393.8,-673.7,105.3,484.4); # NPC: A_Sporadic_Stormrider
        	quest::spawn2(215446,0,0,-318.5,-637.7,105.4,485); # NPC: A_Sporadic_Stormrider
        	quest::spawn2(215446,0,0,-381.7,-567.2,110.0,480); # NPC: A_Sporadic_Stormrider
     	}
     	elsif ($signal == 2 && defined($qglobals{event_start}) && !defined($qglobals{wind_done})) 
     	{
     		$counter+=1;

     		if ($counter == 3) 
     		{
     	   		quest::spawn2(215449,0,0,-375,-659,105.13,11.8); # NPC: Pherlondien_Clawpike
     	   		quest::spawn2(215449,0,0,-342,-649,105.13,437); # NPC: Pherlondien_Clawpike
     	   		quest::spawn2(215448,0,0,-338,-611,105.13,347.8); # NPC: #Pherlondien_Clawpike
     	   		quest::spawn2(215449,0,0,-364,-594,106.61,278.8); # NPC: Pherlondien_Clawpike
     	   		quest::spawn2(215449,0,0,-396,-603,105.56,192.8); # NPC: Pherlondien_Clawpike
           		$counter=0;
     		}
     	}
     	elsif ($signal == 3 && defined($qglobals{event_start}) && !defined($qglobals{wind_done})) 
     	{
           	quest::depop_withtimer(215057);
     	   	quest::spawn2(215451,0,0,-1589.9,484.5,15.1,381.2); # NPC: #Avatar_of_Wind
     	}
     	elsif ($signal == 4 && !defined($qglobals{wind_done})) 
	{
        	quest::setglobal("wind_done",1,3,"F");
     	}
	elsif ($signal == 5 && !defined($qglobals{event_start}) && !defined($qglobals{wind_done})) 
	{	
		#A_Mischievous_Stormrider, A_Fearsome_Stormrider, A_Stormrider_Lightningclaw, A_Marauding_Stormrider
		if(!$entity_list->IsMobSpawnedByNpcTypeID(215002) && !$entity_list->IsMobSpawnedByNpcTypeID(215014) && !$entity_list->IsMobSpawnedByNpcTypeID(215013) && !$entity_list->IsMobSpawnedByNpcTypeID(215065)) 
		{ 
			quest::spawn2(215447,0,0,-260,-724,111,447); # NPC: Stormrider_Priest_of_Destruction
			quest::spawn2(215487,0,0,-261,-700,113,442);
			quest::spawn2(215487,0,0,-265,-705,112,446);
			quest::spawn2(215487,0,0,-271,-709,111,440);
			quest::spawn2(215487,0,0,-275,-713,110,443);
			quest::spawn2(215487,0,0,-269,-692,113,446);
			quest::spawn2(215487,0,0,-272,-695,112,441);
			quest::spawn2(215487,0,0,-278,-699,111,438);
			quest::spawn2(215487,0,0,-284,-702,111,440);
			quest::setglobal("event_start",1,3,"H2");
		}
	}
	elsif ($signal == 6)
	{
		quest::delglobal("wind_done");
	}
}
