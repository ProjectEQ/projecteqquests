sub EVENT_COMBAT{
	if($combat_state==1){
		quest::emote("drips glowing red venom that burns like lamp oil when it hits the ground.");
	}
}

sub EVENT_DEATH{
	quest::emote("oozes a thick smoke from its many wounds.");
}