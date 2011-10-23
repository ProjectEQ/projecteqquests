sub EVENT_COMBAT{
	if($combat_state==1){
		quest::emote("screeches as it spots potential prey.");
	}
}

sub EVENT_DEATH{
	quest::emote("falls to the ground as its wings give out.");
}