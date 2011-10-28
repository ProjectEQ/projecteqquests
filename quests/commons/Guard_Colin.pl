sub EVENT_COMBAT{
	if($combat_state==1){
		quest::say("You're not welcome in Freeport.");
	}
}

sub EVENT_DEATH{
	quest::say("Your name shall be added to the most wanted list of the Freeport Militia!!");
}