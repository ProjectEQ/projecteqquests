sub EVENT_FISH_SUCCESS {
	if($client->GetGlobal("paladin_epic")==3) {
		if($fished_item==69914) {
			$client->Message(1,"As you reel in the dark fish's scale, you notice a large fish in the water");
			quest::depopall(182150);
			quest::spawn2(182150,0,0,1781,1033,38.6,200);
		}
	}
}