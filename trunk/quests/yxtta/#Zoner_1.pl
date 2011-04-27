sub EVENT_SPAWN {
  	$x = $npc->GetX();
   	$y = $npc->GetY();
	quest::set_proximity($x - 10, $x + 10, $y - 10, $y + 10);
}

sub EVENT_ENTER {
$InInstanceUqua = quest::GetInstanceID("uqua",0);
  if(!defined $qglobals{uqualockout}) {
    if($InInstanceUqua > 0){
		quest::MovePCInstance(292,$InInstanceUqua,-17,-7,-24);
	}
        else {
		$client->Message(13, "You are not a part of an instance!");
	}
    }
        else {
	    quest::say("You have recently completed this raid, please come back at a later point");
	}
}