sub EVENT_COMBAT{
	if($combat_state==1){
		quest::say("There must be hundreds of interlopers in this place of nature, and this one has just crossed paths with terrible fate!");
	}
}

sub EVENT_DEATH{
	quest::say("Aaaaagh, not like this!");
}