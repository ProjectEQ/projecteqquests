sub EVENT_COMBAT {
	if($combat_state == 1){
		quest::say("Die, like the fool you are!");
	}
}

sub EVENT_DEATH {
	quest::say("My comrades will avenge my death.");
}