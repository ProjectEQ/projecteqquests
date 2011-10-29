sub EVENT_COMBAT {
	if($combat_state==1){
		quest::say("Tra la la.  In the name of the Dark Reflection, you will die now.");
	}
	if($combat_state==0){
		quest::say("Ha haa!  Told you!");
	}
}

sub EVENT_DEATH {
	quest::say("Tra la . . . Oh . . . Rats . . .");
}