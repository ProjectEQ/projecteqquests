sub EVENT_SPAWN {
	#afk check to not draw a model
  	$x = $npc->GetX();
   	$y = $npc->GetY();
	quest::set_proximity($x - 75, $x + 75, $y - 75, $y + 75);
}

sub EVENT_ENTER {
	$client->SignalClient(1);
}

sub EVENT_EXIT {
	$client->SignalClient(1);
}

sub EVENT_SAY {
   if($text=~/Hail/i) {
     quest::say("Hello $name. Welcome to the Alcove of Shadow. Here we are devoted to serving the will of the mistress of Shadow, Luclin. Luclin is the ruler of the twilight -- that which exists between light and dark, life and death. When brave adventurers fall in the realms of Norrath, their material bodies must pass through the dusk of existence. It is from these shadows that we are able to sometimes call them back through the blessing of our mistress. Should you seek to reclaim some memento of your former life, the priests of Shadow may be able to [help] you.");
   }
     if($text=~/help/i) {
     quest::say("If you are in need, one of our priests may be able to summon back the remnants of your former life before they drift completely into darkness. However, our magic requires a focus. The more powerful the body was in life, the harder it is to summon forth from the shadows. Select from the foci I sell carefully, for you may find that it is not adequate to coax your body to our altars.");
   }
} 