sub EVENT_COMBAT{
	if($combat_state==1){
		quest::emote("charges as its multi-faceted eyes shimmer like fire.");
	}
}

sub EVENT_DEATH{
	quest::emote("oozes fiery blood across the ground.");
}