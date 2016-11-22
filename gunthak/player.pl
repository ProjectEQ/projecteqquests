sub EVENT_FISH_SUCCESS {
	if($client->GetGlobal("paladin_epic")==3) {
		if($fished_item==69914) {
			$client->Message(1,"As you reel in the dark fish's scale, you notice a large fish in the water");
			quest::depopall(224432);
			quest::spawn2(224432,0,0,-589.5,-134,-55.9,125);
		}
	}
}