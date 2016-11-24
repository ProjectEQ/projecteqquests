sub EVENT_FISH_SUCCESS {
	if($client->GetGlobal("paladin_epic")==3) {
		if($fished_item==69914) {
			$client->Message(1,"As you reel in the dark fish's scale, you notice a large fish in the water");
			quest::depopall(93306);
			quest::spawn2(93306,0,0,-2000,3905,-181.7,129);
		}
	}
}