
sub EVENT_COMBAT {
	if($combat_state==1){
		quest::say("And to think I thought it was safe to live in the plains.");
	}
}

sub EVENT_DEATH {
	quest::say("Karana shall guide the Knights of Thunder to avenge the death of one of his flock.");
}
