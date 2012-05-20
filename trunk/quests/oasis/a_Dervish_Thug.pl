sub EVENT_COMBAT {
	if($combat_state == 1){
		quest::say("Time to die $name");
	}
}
