sub EVENT_WAYPOINT_ARRIVE {
	if($wp == 18) {
    quest::emote("makes a withdrawal");
	}
	if($wp == 31) {
    $npc->SetAppearance(1);
	}
	if($wp == 46) {
    $npc->SetAppearance(1);
	quest::emote("begins her daily weaving with a whistle and a smile.");
	}
	if($wp == 71) {
    $npc->SetAppearance(3);
	}
}

