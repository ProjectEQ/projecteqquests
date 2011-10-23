sub EVENT_COMBAT{
	if($combat_state==1){
		quest::emote("charges, leaving a trail of burning footprints across the ground.");
	}
}

sub EVENT_DEATH{
	quest::emote("collapses and begins to crumble into glowing embers.");
}