sub EVENT_COMBAT{
	if($combat_state==1){
		quest::emote("slithers towards its prey, ready to attack.");
	}
}

sub EVENT_DEATH{
	quest::emote("sinks to the ground, its scales dripping with rivulets of blood.");
}