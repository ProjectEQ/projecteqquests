sub EVENT_COMBAT{
	if($combat_state==1){
		quest::emote("smacks the flat of his blade against the palm of his hand and says, 'You want a taste of this, ?!!'");
	}
	if($combat_state==0){
		quest::emote("smirks and shakes his head.  'That's what you get for messing with the Freeport Militia!!'");
	}
}
