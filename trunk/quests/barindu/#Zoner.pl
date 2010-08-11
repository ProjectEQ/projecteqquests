sub EVENT_SPAWN {
  	$x = $npc->GetX();
   	$y = $npc->GetY();
	quest::set_proximity($x - 10, $x + 10, $y - 10, $y + 10);
}

sub EVENT_ENTER {
	$InInstancePlant = quest::GetInstanceID("snplant",0);
	$InInstancePlant1 = quest::GetInstanceID("snplant",1);
	$InInstanceCrem = quest::GetInstanceID("sncrematory",0);
	$InInstancePool = quest::GetInstanceID("snpool",0);
	$InInstanceLair = quest::GetInstanceID("snlair",0);
	if($InInstancePlant1 > 0){
		quest::MovePCInstance(287, $InInstancePlant1, 150, 127, -7);
	}
	elsif($InInstancePlant > 0){
	    	quest::MovePCInstance(287, $InInstancePlant, 150, 127, -7);
	}	
	elsif($InInstanceCrem > 0){
    		quest::MovePCInstance(288, $InInstanceCrem, 31, 175, -17);	
	}
	elsif($InInstancePool > 0){
    		quest::MovePCInstance(285, $InInstancePool, 137, -5, -19);
	}
	elsif($InInstanceLair > 0){
		quest::MovePCInstance(286, $InInstanceLair, 234, -70, -14);
	}	
	else {
		$client->Message(13, "You are not a part of an instance!");
	}
}
