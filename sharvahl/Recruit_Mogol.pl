sub EVENT_SIGNAL {
	if ($signal == 1) {
		quest::say("Aye. Sir!");
		plugin::DoAnim("nodyes");
		quest::signalwith(155126,1,15); # NPC: Instructor_Anom
	}
	if ($signal == 2) {
		plugin::DoAnim("bash");
		quest::signalwith(155126,2,15); # NPC: Instructor_Anom
	}
}
