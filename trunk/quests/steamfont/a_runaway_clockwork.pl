sub EVENT_COMBAT{
	if($combat_state==1){
		quest::say("Click..  Inferior being.  Red 5 shall exterminate.");
	}
}

sub EVENT_DEATH{
	quest::say("Scrap..  Red 5 shall salvage for parts.");
}