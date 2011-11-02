sub EVENT_COMBAT {
	if($combat_state==1) {
		quest::say("You shall die this day, foolish whelp, but it is not unto me that you will give you live, but to firiona Vie's failure you shall perish!");
	}
}

sub EVENT_DEATH {
	quest::say("A single battle you have won, but so quick to think that this will be the end?  I, like Fear, am eternal, and in your dreams, I shall forever haunt.");
}