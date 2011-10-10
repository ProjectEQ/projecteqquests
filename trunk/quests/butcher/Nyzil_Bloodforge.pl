sub EVENT_COMBAT {
	if($combat_state == 1) {
	quest::say("Now you shall know the skill of a member of the Bloodforge Brigade!!");
	}
	if($combat_state == 0) {
	quest::say("Yet another victory for Kaladim and the Bloodforge Brigade!");
	}
}