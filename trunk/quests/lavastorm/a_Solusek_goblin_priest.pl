sub EVENT_COMBAT{
	if($combat_state==1){
		quest::emote("narrows its eyes which glow with an inner heat.");
	}
}

sub EVENT_DEATH{
	quest::emote("falss and begins to smolder.");
}