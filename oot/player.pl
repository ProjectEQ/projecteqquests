sub EVENT_ENTERZONE {
	if(defined $qglobals{strongbox}) { 
		quest::creategroundobject(13860, -9200, -430, -293, 0, 3000000);
		quest::delglobal("strongbox");
	}
}

sub EVENT_FISH_SUCCESS {
	if($client->GetGlobal("paladin_epic")==3) {
		if($fished_item==69914) {
			$client->Message(1,"As you reel in the dark fish's scale, you notice a large fish in the water");
			quest::depopall(69141);
			quest::spawn2(69141,0,0,-9169,265,-20.5,460); # NPC: #A_Corrupted_Koalindl
		}
	}
}
