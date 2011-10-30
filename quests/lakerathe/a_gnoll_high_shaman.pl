sub EVENT_COMBAT {
	if($combat_state==1) {
		quest::say("Hail.. Prime.. Healer!!");
	}
}

sub EVENT_DEATH {
	quest::say("Temple.. Life.. Get you!!  Yes..");
}
