sub EVENT_SAY {
         if($text=~/Hail/i) {
            quest::emote("grins widely, 'Hello $name, would you like to do some banking today?'");
         }
}

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