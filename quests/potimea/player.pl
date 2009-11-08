sub EVENT_CLICKDOOR 
{
	my $d_id = ($doorid % 256);
	#The player has not recently defeated Quarm, phase 4, or phase 5, then let them in.
	if((!defined $qglobals{quarm_down} && !defined $qglobals{timepokport}) && (!defined $qglobals{potb_p4_comp_pl} || !defined $qglobals{potb_p5_comp_pl} || !defined $qglobals{quarm}))
     	{
		if($d_id == 8)
		{ 
			quest::emote("The portal, dim at first, begins to glow brighter.");
             		quest::emote("The portal flashes briefly, then glows steadily.");
             		quest::movepc(223,-36,1352,496,128);
       		}
    		elsif($d_id == 9)
    		{
              		quest::emote("The portal, dim at first, begins to glow brighter.");
              		quest::emote("The portal flashes briefly, then glows steadily.");
              		quest::movepc(223,-51,857,496,128);
       		}
    		elsif($d_id == 10)
    		{
              		quest::emote("The portal, dim at first, begins to glow brighter.");
              		quest::emote("The portal flashes briefly, then glows steadily.");
              		quest::movepc(223,-35,1636,496,128);
       		}
	    	elsif($d_id == 11)
	    	{
              		quest::emote("The portal, dim at first, begins to glow brighter.");
              		quest::emote("The portal flashes briefly, then glows steadily.");
              		quest::movepc(223,-55,569,496,128);
       		}
    		elsif($d_id == 12)
    		{
              		quest::emote("The portal, dim at first, begins to glow brighter.");
              		quest::emote("The portal flashes briefly, then glows steadily.");
              		quest::movepc(223,-27,1103,496,128);
      		}
    		elsif($d_id == 13)
    		{
              		quest::movepc(223,865,-150,395,999);
       		}
    	}
	$qglobals{timepokport}=undef;
       	$qglobals{potb_p2_comp_pl}=undef;
       	$qglobals{potb_p3_comp_pl}=undef;
       	$qglobals{potb_p4_comp_pl}=undef;
       	$qglobals{potb_p5_comp_pl}=undef;
       	$qglobals{potb_p2_comp}=undef;
       	$qglobals{potb_p3_comp}=undef;
       	$qglobals{potb_p4_comp}=undef;
       	$qglobals{potb_p5_comp}=undef;
       	$qglobals{quarm}=undef;
}    