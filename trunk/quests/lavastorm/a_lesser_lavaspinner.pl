sub EVENT_COMBAT{
	if($combat_state==1){
		quest::emote("scuttles from the shadows.");
	}
}

sub EVENT_DEATH{
	quest::emote("falls in a heap and continues dripping poison from its fangs.");
}