sub EVENT_COMBAT {
	if($combat_state==1) {
		quest::say("Die like a fool you are!");
	}
}

sub EVENT_DEATH {
	quest::say("Bertoxxuloussss.. shall find you.");
}
