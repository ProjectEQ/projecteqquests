sub EVENT_COMBAT {
	if($combat_state == 1){
		quest::say("Time to die $name");
		quest::say("Your actions and history are a personal affront to all I stand for!");
	}
	
}

sub EVENT_DEATH {
	quest::say("My comrades will avenge my death.");
}