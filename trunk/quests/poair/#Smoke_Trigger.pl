sub EVENT_SPAWN 
{
	$counter = 0;
}    

sub EVENT_SIGNAL 
{
	if ($signal == 1 && defined($qglobals{smoke_event_start}) && !defined($qglobals{smoke_done})) 
	{
		$counter+=1;
		
     		if ($counter == 4) 
     		{
        		quest::spawn2(215454,0,0,-445.6,-1291.9,317.6,70.1);
        	}
     	}
     	elsif ($signal == 2 && defined($qglobals{smoke_event_start}) && !defined($qglobals{smoke_done})) 
     	{
     		quest::spawn2(215435,0,0,1395.9,-681.3,15.1,255.1);
        	quest::depop_withtimer(215055);
     	}
     	elsif ($signal == 3  && !defined($qglobals{smoke_done})) 
     	{
        	quest::setglobal("smoke_done",1,3,"F");
     	}
	elsif ($signal == 4 && !defined($qglobals{smoke_event_start}) && !defined($qglobals{smoke_done})) 
	{
		#A_Confused_Air_Elemental
		if(!$entity_list->IsMobSpawnedByNpcTypeID(215012)) 
		{
			quest::spawn2(215066,0,0,-403.1,-1375.5,320.8,234.9); 
			quest::spawn2(215066,0,0,-501.9,-1205.9,318.6,99.0);
			quest::spawn2(215066,0,0,-341.1,-1245.2,317.6,182.8);
			quest::spawn2(215066,0,0,-523.3,-1288.2,321.7,63.0);
			quest::setglobal("smoke_event_start",1,3,"H2");
			$counter=0;
		}
	}
	elsif ($signal == 5)
	{
		quest::delglobal("smoke_done");
	}
}