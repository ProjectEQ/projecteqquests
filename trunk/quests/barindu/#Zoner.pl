sub EVENT_SPAWN {
  	$x = $npc->GetX();
   	$y = $npc->GetY();
	quest::set_proximity($x - 20, $x + 20, $y - 20, $y + 20);
}

sub EVENT_ENTER {
	$InInstancePlant = quest::GetInstanceID("snplant",0);
	$InInstanceCrem = quest::GetInstanceID("sncrematory",0);
	$InInstancePool = quest::GetInstanceID("snpool",0);
	$InInstanceLair = quest::GetInstanceID("snlair",0);
	if($InInstancePlant){
	    	quest::MovePCInstance(287, $InInstancePlant, 150, 127, -7);
	}	
	elsif($InInstanceCrem){
    		quest::MovePCInstance(288, $InInstanceCrem, 31, 175, -17);	
	}
	elsif($InInstancePool){
    		quest::MovePCInstance(285, $InInstancePool, 137, -5, -19);
	}
	elsif(InInstanceLair){
		quest::MovePCInstance(286, $InInstanceLair, 234, -70, -14);
	}	
	else {
		$client->Message(13, "You are not a part of an instance!");
	}
}

