sub EVENT_COMBAT{
	if($combat_state==1){
		quest::emote("lunges, baring its fang.");
	}
}

sub EVENT_DEATH{
	quest::emote("snarls and collapses.");
}