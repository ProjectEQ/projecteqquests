sub EVENT_COMBAT {
	if($combat_state == 1){
		quest::say("Time to die $name");
		quest::say("Your intolerable reputation insults all in this realm!");
	}
	
}

sub EVENT_DEATH {
	quest::say("My comrades will avenge my death.");
}