sub EVENT_COMBAT{
	if($combat_state==1){
		quest::emote("glares menacingly as the air fills with the smell of ash and smoke.");
	}
}

sub EVENT_DEATH{
	quest::emote("falls as its remains turn to a fine ash.");
}