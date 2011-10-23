sub EVENT_COMBAT{
	if($combat_state==1){
		quest::emote("flies into a battle as strong winds blows all around.");
	}
}

sub EVENT_DEATH{
	quest::emote("unleashes a low runbling moan.");
}