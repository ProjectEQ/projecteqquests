sub EVENT_SAY {
  	if ($text=~/hail/i) {
    		quest::say("I don't know why you would want to, but if you want me to tell you the way to one of the different areas of the sewers let me know.  I know how to get to the treatment [plant], [crematory], [pools] of sludge, or the [lair] of trapped ones.");
  	}
  	if ($text=~/plant/i) {
  	$InInstancePlant = quest::GetInstanceID("snplant",0);
    		quest::say("Ok, listen closely...");
    		if(!$InInstancePlant){
    			$Instance = quest::CreateInstance("snplant", 0, 10800);
    			quest::AssignGroupToInstance($Instance);	
    			quest::MovePCInstance(287, $Instance, 150, 127, -7);
    		}
    		if($InInstancePlant){
    			quest::MovePCInstance(287, $InInstancePlant, 150, 127, -7);
    		}	
  	}
  	if ($text=~/crematory/i) {
   	$InInstanceCrem = quest::GetInstanceID("sncrematory",0);
	    	quest::say("Ok, listen closely...");
	    	if(!$InInstanceCrem){
	    		$Instance = quest::CreateInstance("sncrematory", 0, 10800);
	    		quest::AssignGroupToInstance($Instance);	
	    		quest::MovePCInstance(288, $Instance, 31, 175, -17);
	    	}
	    	if($InInstanceCrem){
	    		quest::MovePCInstance(288, $InInstanceCrem, 31, 175, -17);
	    	}	
  	}
	if ($text=~/pools/i) {
    	$InInstancePool = quest::GetInstanceID("snpool",0);
	    	quest::say("Ok, listen closely...");
	    	if(!$InInstancePool){
	    		$Instance = quest::CreateInstance("snpool", 0, 10800);
	    		quest::AssignGroupToInstance($Instance);	
	    		quest::MovePCInstance(285, $Instance, 137, -5, -19);
	    	}
	    	if($InInstancePool){
	    		quest::MovePCInstance(285, $InInstancePool, 137, -5, -19);
	    	}	
  	}
	if ($text=~/lair/i) {
    	$InInstanceLair = quest::GetInstanceID("snlair",0);
	    	quest::say("Ok, listen closely...");
	    	if(!$InInstanceLair){
	    		$Instance = quest::CreateInstance("snlair", 0, 10800);
	    		quest::AssignGroupToInstance($Instance);	
	    		quest::MovePCInstance(286, $Instance, 234, -70, -14);
	    	}
	    	if($InInstanceLair){
	    		quest::MovePCInstance(286, $InInstanceLair, 234, -70, -14);
	    	}	
  	
	}
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}