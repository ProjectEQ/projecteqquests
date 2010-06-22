sub EVENT_SAY {
	$InInstancePlant = quest::GetInstanceID("snplant",0);
	$InInstanceCrem = quest::GetInstanceID("sncrematory",0);
	$InInstancePool = quest::GetInstanceID("snpool",0);
	$InInstanceLair = quest::GetInstanceID("snlair",0);
  	if ($text=~/hail/i) {
    		quest::say("I don't know why you would want to, but if you want me to tell you the way to one of the different areas of the sewers let me know.  I know how to get to the treatment [plant], [crematory], [pools] of sludge, or the [lair] of trapped ones.");
  	}
  	if ($text=~/plant/i) {
    		quest::say("Ok, listen closely...");
    		if(!$InInstancePlant && !$InInstanceCrem && !$InInstancePool && !$InInstanceLair){
    			$Instance = quest::CreateInstance("snplant", 0, 10800);
    			quest::AssignGroupToInstance($Instance);
    			quest::say("Instance added.");
    		}
    		else {
			$client->Message(13, "You are already in an instance!");
		}
  	}
  	if ($text=~/crematory/i) {
	    	quest::say("Ok, listen closely...");
	    	if(!$InInstancePlant && !$InInstanceCrem && !$InInstancePool && !$InInstanceLair){
	    		$Instance = quest::CreateInstance("sncrematory", 0, 10800);
	    		quest::AssignGroupToInstance($Instance);	
	    		quest::say("Instance added.");
	    	}	
	    	else {
			$client->Message(13, "You are already in an instance!");
		}
  	}
	if ($text=~/pools/i) {
	    	quest::say("Ok, listen closely...");
	    	if(!$InInstancePlant && !$InInstanceCrem && !$InInstancePool && !$InInstanceLair){
	    		$Instance = quest::CreateInstance("snpool", 0, 10800);
	    		quest::AssignGroupToInstance($Instance);	
	    		quest::say("Instance added.");
	    	}	
	    	else {
			$client->Message(13, "You are already in an instance!");
		}
  	}
	if ($text=~/lair/i) {
	    	quest::say("Ok, listen closely...");
	    	if(!$InInstancePlant && !$InInstanceCrem && !$InInstancePool && !$InInstanceLair){
	    		$Instance = quest::CreateInstance("snlair", 0, 10800);
	    		quest::AssignGroupToInstance($Instance);	
	    		quest::say("Instance added.");
	    	}
	    	else {
			$client->Message(13, "You are already in an instance!");
		}
	}
	
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}