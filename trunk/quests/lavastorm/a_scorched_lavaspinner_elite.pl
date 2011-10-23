sub EVENT_COMBAT{
	if($combat_state==1){
		quest::emote("swivels its body towards potential prey.");
	}
}

sub EVENT_DEATH{
	quest::emote("falls to the ground dead, although its legs continue to twitch.");
}