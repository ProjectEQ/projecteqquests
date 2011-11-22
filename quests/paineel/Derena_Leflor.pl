
sub EVENT_WAYPOINT_ARRIVE {
if($wp eq 14) {
	$npc->SetAppearance(1);
	}
if($wp eq 28) {
	plugin::DoAnim("kneel");
	}
if($wp eq 52) {
	$npc->SetAppearance(1);
	}
}
