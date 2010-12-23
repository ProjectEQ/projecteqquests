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
			if(defined $qglobals{sewers} && $qglobals{sewers} == 2) {			
		    		quest::say("I know that you can do this for us. I have seen your action in this city and have heard of them on the rest of the continent. Please set the spirits of the fallen at ease. Seek out a way to into the crematory, find the remains of Ngozi, Mabiki, Talokoi, and Yogundi. Take the remains into the furnace and their spirits will present themselves. All will become clear when the time has come.");
		    		if($InInstancePlant == 0 && $InInstanceCrem == 0 && $InInstancePool == 0 && $InInstanceLair == 0){
		    			$Instance = quest::CreateInstance("sncrematory", 0, 10800);
		    			quest::AssignGroupToInstance($Instance);	
		    			quest::say("Instance added.");
		    		} else {
					$client->Message(13, "You are already in an instance!");
				}
		    	} elsif(defined $qglobals{sewers} && $qglobals{sewers} == 3) {
	    			quest::say("Our sewer system was an integral part of the city before the great explosion. After the sewer system was deserted by most Taelosians, many of the processes that occurred below the city ceased to work. In the sewers, many insects, animals, and other slimy diseased creatures thrive. Take this seal. I know that Alej is very timid and may think you are there to harm him unless he sees something familiar from you. Please be careful while you're down there and be on the look out for cave-ins.");
	    			if($InInstancePlant == 0 && $InInstanceCrem == 0 && $InInstancePool == 0 && $InInstanceLair == 0){
	    				$Instance = quest::CreateInstance("snlair", 0, 10800);
	    				quest::AssignGroupToInstance($Instance);	
	    				quest::say("Instance added.");
	    				quest::summonitem(68298);
	    			} else {
					$client->Message(13, "You are already in an instance!");
				}
	    		} elsif(defined $qglobals{sewers} && $qglobals{sewers} >= 4) {
		    		quest::say("Utandi, the map maker, should be in the sewers. I must apologize for him in advance. He is wonderful with his maps, but very timid. Good luck and I hope that we can stand together, defiant against the invaders.");
		    		if($InInstancePlant == 0 && $InInstanceCrem == 0 && $InInstancePool == 0 && $InInstanceLair == 0){
		    			$Instance = quest::CreateInstance("snpool", 0, 10800);
		    			quest::AssignGroupToInstance($Instance);	
		    			quest::say("Instance added.");
		    			quest::setglobal("sewers",5,5,"F");
		    		} else {
					$client->Message(13, "You are already in an instance!");
				}
	    		} else {
				quest::say("Go find Ansharu. He has been researching their behavior patterns, and will be able to tell you what needs to be done. I hope that you will be able to help us out in these dire times. Please head to the sewer plant and find the source of the stonemite infestation. If you do this for us, I will share with you how to pass through the mountains and up to the temples created by the trusik, our exiled kin.");
				if($InInstancePlant == 0 && $InInstanceCrem == 0 && $InInstancePool == 0 && $InInstanceLair == 0){
					$Instance = quest::CreateInstance("snplant", 1, 10800);
					quest::AssignGroupToInstance($Instance);	
					quest::say("Instance added.");
				} else {
					$client->Message(13, "You are already in an instance!");
				}
	    		}
		} else {
		           $client->Message(13, "You are not in a group!");
        	}
	}
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}