sub EVENT_COMBAT {
	if($combat_state==1) {
		quest::say("Natural selection at work.");
	}
}

sub EVENT_DEATH {
	quest::say("My comrades will avenge my death.");
}

