sub EVENT_SPAWN {
  	$x = $npc->GetX();
   	$y = $npc->GetY();
	quest::set_proximity($x - 10, $x + 10, $y - 10, $y + 10);
}

sub EVENT_ENTER {
	$InInstanceTipt = quest::GetInstanceID("tipt",0);
	$InInstanceVxed = quest::GetInstanceID("vxed",0);
	if($InInstanceTipt > 0){
		quest::MovePCInstance(289, $InInstanceTipt, -448, -2374, 12);
	}
	elsif($InInstanceVxed > 0){
	    	quest::MovePCInstance(290, $InInstanceVxed, -427, -3552, 14);
	}	
	else {
		$client->Message(13, "You are not a part of an instance!");
	}
}
