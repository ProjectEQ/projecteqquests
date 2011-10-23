sub EVENT_COMBAT{
	if($combat_state==1){
		quest::emote("circles in to attack.");
	}
}

sub EVENT_DEATH{
	quest::emote("crumples into a tangled mass of blood and broken wings.");
}