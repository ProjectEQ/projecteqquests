sub EVENT_COMBAT{
	if($combat_state==1){
		quest::emote("opens its jaws and scuttles forward.");
	}
}

sub EVENT_DEATH{
	quest::emote("sinks to the ground, its scales dripping with rivulets of blood.");
}