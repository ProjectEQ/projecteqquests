sub EVENT_WAYPOINT_ARRIVE {
	if($wp == 6) {
    quest::say("Greetings honorable Sadhi. I ask for spiritual guidance to serve our king.");
	}
	if($wp == 17) {
    quest::say("reporting for duty m'lord. I will defend Shar Vahl with your blessing.");
	$npc->SetAppearance(4);
	}
}
