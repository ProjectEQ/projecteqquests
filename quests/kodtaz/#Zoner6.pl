sub EVENT_SPAWN {
  	$x = $npc->GetX();
   	$y = $npc->GetY();
	quest::set_proximity($x - 10, $x + 10, $y - 10, $y + 10);
}

sub EVENT_ENTER {
$InInstanceIkky6 = quest::GetInstanceID("ikkinz",5);
    if($InInstanceIkky6 > 0){
		quest::MovePCInstance(294,$InInstanceIkky6,-157,27,-2);
	}
        else {
		$client->Message(13, "You are not a part of an instance!");
	}
}