sub EVENT_SPAWN 
{
     	quest::settimer("potstatus",900);
}

sub EVENT_TIMER 
{
	if($timer eq "potstatus") 
	{
		if(defined $qglobals{potb_p1_start}) 
		{
      			quest::shout("There currently is a group in Plane of Time. They are currently on phase 1. The zone is open to new players, however as a courtesy please ask the group if you may join before entering. Estimated time remaining: less than 14 hours");
		}
   		elsif(defined $qglobals{potb_p1_comp}) 
   		{
      			quest::shout("There currently is a group in Plane of Time. They are currently on phase 2. The zone is open to new players, however as a courtesy please ask the group if you may join before entering. Estimated time remaining: less than 13 hours");
		}
   		elsif(defined $qglobals{potb_p2_comp}) 
   		{
      			quest::shout("There currently is a group in Plane of Time. They are currently on phase 3. Estimated time remaining: less than 11 hours");
		}
   		elsif(defined $qglobals{potb_p3_comp}) 
   		{
      			quest::shout("There currently is a group in Plane of Time. They are currently on phase 4. Estimated time remaining: less than 10 hours");
		}
   		elsif(defined $qglobals{potb_p4_comp}) 
   		{
      			quest::shout("There currently is a group in Plane of Time. They are currently on phase 5. Estimated time remaining: less than 6 hours");
		}
   		elsif(defined $qglobals{potb_p5_comp}) 
   		{
      			quest::shout("There currently is a group in Plane of Time. They are currently fighting Quarm. Estimated time remaining: less than 2 hours");
		}
   		elsif(defined $qglobals{quarm_down}) 
   		{
      			quest::shout("Quarm was recently defeated. Please allow the zone a few minutes to reset. Estimated time remaining: less than 10 minutes");
		}
  		else
  		{ 
      			quest::shout("Plane of Time is currently empty and open for visitors.");
  		}
 	}
       	$qglobals{potb_p1_start}=undef;
       	$qglobals{potb_p1_comp}=undef;
       	$qglobals{potb_p2_comp}=undef;
       	$qglobals{potb_p3_comp}=undef;
       	$qglobals{potb_p4_comp}=undef;
       	$qglobals{potb_p5_comp}=undef;
       	$qglobals{quarm_down}=undef;
}