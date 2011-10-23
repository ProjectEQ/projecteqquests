sub EVENT_COMBAT{
	if($combat_state==1){
		quest::emote("twists into battle, gathering loose debris as it goes");
	}
}

sub EVENT_DEATH{
	quest::emote("slows its spinning until it eventually disappears entirely");
}