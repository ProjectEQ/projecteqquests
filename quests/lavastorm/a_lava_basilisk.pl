sub EVENT_COMBAT{
	if($combat_state==1){
		quest::emote("snarls and attacks.");
	}
}

sub EVENT_DEATH{
	quest::emote("shudders and collapses.");
}