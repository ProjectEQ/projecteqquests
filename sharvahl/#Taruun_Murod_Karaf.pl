sub EVENT_WAYPOINT_ARRIVE {
	if($wp == 22) {
    quest::emote("orders a drink.");
	}
	if($wp == 39) {
    $npc->SetAppearance(1);
	}
	if($wp == 63) {
    $npc->SetAppearance(3);
	}
}
