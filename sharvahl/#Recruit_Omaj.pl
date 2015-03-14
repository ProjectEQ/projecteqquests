sub EVENT_SIGNAL {
	if ($signal == 1) {
		$npc->SetAppearance(1);
	}
	if ($signal == 2) {
		$npc->SetAppearance(0);
	}
	if ($signal == 3) {
		plugin::DoAnim("kick");
	}
	if ($signal == 4) {
		plugin::DoAnim("bash");
	}
	if ($signal == 5) {
		plugin::DoAnim("pierce");
	}
	if ($signal == 6) {
		plugin::DoAnim("2hblunt");
	}
	if ($signal == 7) {
		plugin::DoAnim("2hslash");
	}
	if ($signal == 8) {
		plugin::DoAnim("mainhand");
	}
	if ($signal == 9) {
		$npc->SetAppearance(1);
	}
}