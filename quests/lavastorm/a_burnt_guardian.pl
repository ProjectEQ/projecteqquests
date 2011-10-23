sub EVENT_COMBAT{
	if($combat_state==1){
		quest::emote("raises its bones and advances.");
	}
}

sub EVENT_DEATH{
	quest::emote("shatters as it hits the ground, its bones scattered.");
}