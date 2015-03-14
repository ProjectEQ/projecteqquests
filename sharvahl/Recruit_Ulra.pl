sub EVENT_SIGNAL {
	if ($signal == 1) {
		quest::say("I guess so...");
		plugin::DoAnim("nodyes");
		quest::signalwith(155132,1,1);
	}
	if ($signal == 2) {
		plugin::DoAnim("bash");
		quest::signalwith(155132,2,1);
	}
}
