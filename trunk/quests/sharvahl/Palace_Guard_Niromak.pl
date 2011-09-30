sub EVENT_WAYPOINT_ARRIVE {
	if($wp == 15) {
    $npc->SetAppearance(3);
	}
	if($wp == 32) {
    quest::say("reporting for duty m'lord. I will defend Shar Vahl with your blessing.");
	$npc->SetAppearance(4);
	}
}
