sub EVENT_COMBAT{
	if($combat_state==1){
		quest::emote("charges ahead with the intent to pummel its victim.");
	}
}

sub EVENT_DEATH{
	quest::emote("dissipates as it hits the ground.");
}