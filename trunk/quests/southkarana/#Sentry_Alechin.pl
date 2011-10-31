sub EVENT_COMBAT {
	if($combat_state==1) {
		quest::say("What foolishness is this?!  Erollisi will not approve of your actions!!");
	}
}

sub EVENT_DEATH {
	quest::say("The Priests of Marr will not overlook my death.  I pity you.");
}