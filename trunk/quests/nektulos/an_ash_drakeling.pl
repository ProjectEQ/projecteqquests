sub EVENT_COMBAT{
	if($combat_state==1){
		quest::emote("screeches shrilly as it swoops in to attack.");
	}
}

sub EVENT_DEATH{
	quest::emote("falls to the ground with a pathetic screech");
}