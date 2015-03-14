sub EVENT_SPAWN {
  	$x = $npc->GetX();
   	$y = $npc->GetY();
	quest::set_proximity($x - 10, $x + 10, $y - 10, $y + 10);
}

sub EVENT_ENTER {
	$InInstanceIkky4 = quest::GetInstanceID("ikkinz",3);
	
    if($InInstanceIkky4 > 0){
		quest::MovePCInstance(294,$InInstanceIkky4,-157,27,-2);
	}
         else {
	    $client->Message(13, "You are not a part of an instance!");
	}
}
