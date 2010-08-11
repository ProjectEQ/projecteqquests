sub EVENT_SAY {
	$InInstancePlant = quest::GetInstanceID("snplant",1);
	$InInstanceCrem = quest::GetInstanceID("sncrematory",0);
	$InInstancePool = quest::GetInstanceID("snpool",0);
	$InInstanceLair = quest::GetInstanceID("snlair",0);
        $group = $client->GetGroup();
  	if ($text=~/hail/i) {
    		quest::say("Do you wish to enter the [sewers]?");
  	}
  	if ($text=~/sewers/i) {
		if($group){
			if(defined $qglobals{sewers} && $qglobals{sewers} == 2){			
		    		quest::say("Ok, listen closely...");
		    		if($InInstancePlant == 0 && $InInstanceCrem == 0 && $InInstancePool == 0 && $InInstanceLair == 0){
		    			$Instance = quest::CreateInstance("sncrematory", 0, 10800);
		    			quest::AssignGroupToInstance($Instance);	
		    			quest::say("Instance added.");
		    		}
		    		else {
					$client->Message(13, "You are already in an instance!");
				}
		    	}	
		    	
			if(defined $qglobals{sewers} && $qglobals{sewers} == 3){
	    			quest::say("Ok, listen closely...");
	    			if($InInstancePlant == 0 && $InInstanceCrem == 0 && $InInstancePool == 0 && $InInstanceLair == 0){
	    				$Instance = quest::CreateInstance("snlair", 0, 10800);
	    				quest::AssignGroupToInstance($Instance);	
	    				quest::say("Instance added.");
	    				quest::summonitem(68298);
	    			}
	    			else {
					$client->Message(13, "You are already in an instance!");
				}
	    		}	
	    		
			if(defined $qglobals{sewers} && $qglobals{sewers} == 4){
		    		quest::say("Ok, listen closely...");
		    		if($InInstancePlant == 0 && $InInstanceCrem == 0 && $InInstancePool == 0 && $InInstanceLair == 0){
		    			$Instance = quest::CreateInstance("snpool", 0, 10800);
		    			quest::AssignGroupToInstance($Instance);	
		    			quest::say("Instance added.");
		    			quest::setglobal("sewers",5,5,"F");
		    		}
		    		else {
					$client->Message(13, "You are already in an instance!");
				}
	    		}
	    		else {
				quest::say("Ok, listen closely...");
				if($InInstancePlant == 0 && $InInstanceCrem == 0 && $InInstancePool == 0 && $InInstanceLair == 0){
					$Instance = quest::CreateInstance("snplant", 1, 10800);
					quest::AssignGroupToInstance($Instance);	
					quest::say("Instance added.");
				}
				else {
					$client->Message(13, "You are already in an instance!");
				}
	    		}
		}
		else {
		           $client->Message(13, "You are not in a group!");
        	}
	}
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}