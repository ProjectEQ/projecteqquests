sub EVENT_COMBAT {
	if($combat_state==1) {
		quest::say("You have happened upon the territory of the dervish cutthroats.  Now, you pay the price!");
	}
}

sub EVENT_DEATH {
	quest::say("Aargh!!  Watch your back, fool.  The dervish cutthroats are everywh.. Ungh..");
}