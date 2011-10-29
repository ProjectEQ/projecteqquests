sub EVENT_COMBAT {
	if($combat_state == 1){
		quest::say("Let me release your soul.");
	}
}

sub EVENT_DEATH {
	quest::say("Your destiny lies at the hands of the Greenbloods.");
}