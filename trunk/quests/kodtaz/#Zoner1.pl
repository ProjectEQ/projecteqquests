sub EVENT_SPAWN {
  	$x = $npc->GetX();
   	$y = $npc->GetY();
	quest::set_proximity($x - 10, $x + 10, $y - 10, $y + 10);
}

sub EVENT_ENTER {
$InInstanceIkky1 = quest::GetInstanceID("ikkinz",0);
    if($InInstanceIkky1 > 0){
		quest::MovePCInstance(294,$InInstanceIkky1,-157,27,-2);
	}
        else {
		$client->Message(13, "You are not a part of an instance!");
	}

}